using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using Behaviour;
using JetBrains.Annotations;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Profiling;
using Utility;

namespace Culling
{
    [Serializable]
    public sealed class CullingGroup
    {
        public bool isDefault;
        public bool isActive;
        public CullingRegion region;
        public readonly List<CullingObject> ObjectsToCull = new();
    }

    [HideMonoScript, DisallowMultipleComponent]
    public sealed class CullingProcessor : SingletonBehaviour<CullingProcessor>
    {
        public struct FrustumStruct
        {
            public float x { get; set; }
            public float z { get; set; }

            public float width { get; set; }
            public float height { get; set; }

            public FrustumStruct(float x, float z, float width, float height)
            {
                this.x = x;
                this.z = z;
                this.width = width;
                this.height = height;
            }

            public bool Contains(Vector3 point) =>
                point.x >= x && point.x < x + width && point.z >= z && point.z < z + height;

            public bool Overlaps(FrustumStruct other) => other.x + other.width > x && other.x < x + width &&
                                                         other.z + other.height > z && other.z < z + height;

            public Vector3 size
            {
                get => new Vector3(this.width, 0f, this.height);
                set
                {
                    this.width = value.x;
                    this.height = value.y;
                }
            }

            public Vector3 center
            {
                get => new Vector3(this.x + this.width / 2f, 0f, this.z + this.height / 2f);
                set
                {
                    this.x = value.x - this.width / 2f;
                    this.z = value.z - this.height / 2f;
                }
            }
        }

        [InlineEditor] public CullingProcessorProfile[] profiles = new CullingProcessorProfile[0];

        private FrustumStruct cameraFrustum;

        private CullingProcessorProfile profile;
        public CullingProcessorProfile GetProfile() => profile;


        protected override void OnAwake()
        {
            RefreshProfile();
        }

        /// <inheritdoc />
        protected override void OnSingletonDestroyed()
        {
            CullingCache.Clear();
            CullingGroups.Clear();
            DefaultCullingGroup = default;
        }

        private void RefreshProfile()
        {
            if (profile == null)
                profile = profiles[0];
        }

        private void FixedUpdate()
        {
            Profiler.BeginSample("Process Culling");
            DoFixedUpdate();
            Profiler.EndSample();
        }

        private void DoFixedUpdate()
        {
            Profiler.BeginSample("Readjust Emitters");
            ReadjustEmitters();
            Profiler.EndSample();

            Profiler.BeginSample("Readjust Objects Rects");
            ReadjustObjectRects();
            Profiler.EndSample();

            Profiler.BeginSample("Process Culling");
            ProcessCulling();
            Profiler.EndSample();
        }

        private void ReadjustEmitters()
        {
            for (var index0 = 0; index0 < CullingPlayerProximityEmitter.Emitters.Count; index0++)
                CullingPlayerProximityEmitter.Emitters[index0].FixedUpdateEmitter();
        }

        private void ReadjustObjectRects()
        {
            for (var index0 = 0; index0 < CullingObject.DynamicInstances.Count; index0++)
                CullingObject.DynamicInstances[index0].FixedUpdateObject();
        }

        private void ProcessCulling()
        {
            var c = Camera.main;
            if (c == null)
            {
                return;
            }

            var cameraPoint = c.transform.position;

            cameraFrustum = new FrustumStruct(
                cameraPoint.x - profile.cameraFrustumWidth / 2f,
                cameraPoint.z - profile.cameraFrustumHeight / 2f,
                profile.cameraFrustumWidth,
                profile.cameraFrustumHeight
            );

#if UNITY_EDITOR
            var r = cameraFrustum;
            Debug.DrawLine(new Vector3(r.x, 0f, r.z), new Vector3(r.x, 0f, r.z + r.height), Color.green);
            Debug.DrawLine(new Vector3(r.x, 0f, r.z), new Vector3(r.x + r.width, 0f, r.z), Color.green);
            Debug.DrawLine(new Vector3(r.x + r.width, 0, r.z), new Vector3(r.x + r.width, 0f, r.z + r.height),
                Color.green);
            Debug.DrawLine(new Vector3(r.x, 0f, r.z + r.height), new Vector3(r.x + r.width, 0f, r.z + r.height),
                Color.green);

            for (var index0 = 0; index0 < CullingPlayerProximityEmitter.Emitters.Count; index0++)
            {
                var emitter = CullingPlayerProximityEmitter.Emitters[index0];
                r = emitter.Frustum;
                Debug.DrawLine(new Vector3(r.x, 0f, r.z), new Vector3(r.x, 0f, r.z + r.height), Color.cyan);
                Debug.DrawLine(new Vector3(r.x, 0f, r.z), new Vector3(r.x + r.width, 0f, r.z), Color.cyan);
                Debug.DrawLine(new Vector3(r.x + r.width, 0f, r.z), new Vector3(r.x + r.width, 0f, r.z + r.height),
                    Color.cyan);
                Debug.DrawLine(new Vector3(r.x, 0f, r.z + r.height), new Vector3(r.x + r.width, 0f, r.z + r.height),
                    Color.cyan);
            }
#endif

            Profiler.BeginSample("RetrieveObjectsInCameraFrustum");
            CullingCache.Clear();
            for (var index0 = 0; index0 < CullingGroups.Count; index0++)
            {
                var group = CullingGroups[index0];
                if (!group.isDefault)
                {
                    group.isActive = CullingUtility.Distance(cameraPoint, group.region.Point) < group.region.distance;
                    if (!group.isActive)
                        continue;
                }
                else group.isActive = true;

                UpdateObjects(group);
            }

            Profiler.EndSample();

            for (var index0 = 0; index0 < SceneCullingInstance.Scenes.Count; index0++)
            {
                var instance = SceneCullingInstance.Scenes[index0];

                Profiler.BeginSample("TestObjectPresence");
                // Test for new objects and remove old ones.
                for (var index1 = 0; index1 < instance.InsideFrustum.Count; index1++)
                {
                    var oldObject = instance.InsideFrustum[index1];
                    var exists = false;
                    for (var index2 = 0; index2 < CullingCache.Count; index2++)
                    {
                        var newObject = CullingCache[index2];
                        if (oldObject == newObject)
                        {
                            exists = true;
                            break;
                        }
                    }

                    if (exists)
                        continue;

                    instance.InsideFrustum.Remove(oldObject);
                    oldObject.SetFrustumState(false);
                }

                UpdateCache(instance);

                Profiler.EndSample();
            }
        }

        private void UpdateObjects(CullingGroup group)
        {
            for (var index1 = 0; index1 < group.ObjectsToCull.Count; index1++)
            {
                var obj = group.ObjectsToCull[index1];
                if (SuppressCulling)
                {
                    CullingCache.Add(obj);
                    continue;
                }

                switch (obj.mode)
                {
                    case CullingMode.ScreenProximity:
                        if (obj.IsOnScreen(cameraFrustum))
                            CullingCache.Add(obj);
                        break;
                    case CullingMode.PlayerProximity:
                        for (var index0 = 0; index0 < CullingPlayerProximityEmitter.Emitters.Count; index0++)
                        {
                            var playerProximityEmitter = CullingPlayerProximityEmitter.Emitters[index0];
                            if (obj.IsOnScreen(playerProximityEmitter.Frustum))
                                CullingCache.Add(obj);
                        }

                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
        }

        private static void UpdateCache(SceneCullingInstance instance)
        {
            for (var index1 = 0; index1 < CullingCache.Count; index1++)
            {
                var newObject = CullingCache[index1];
                var exists = false;
                for (var index2 = 0; index2 < instance.InsideFrustum.Count; index2++)
                {
                    var oldObject = instance.InsideFrustum[index2];
                    if (newObject == oldObject)
                    {
                        exists = true;
                        break;
                    }
                }

                if (exists)
                    continue;

                instance.InsideFrustum.Add(newObject);
                newObject.SetFrustumState(true);
            }
        }

        public static void AddObject([NotNull] CullingObject obj)
        {
            if (obj == null) throw new ArgumentNullException(nameof(obj));

            if (!obj.Dynamic)
            {
                for (var index0 = 0; index0 < CullingGroups.Count; index0++)
                {
                    var cull = CullingGroups[index0];
                    if (cull.isDefault)
                        continue;

                    if (cull.region.Contains(obj.transform.position))
                    {
                        cull.ObjectsToCull.Add(obj);
                        return;
                    }
                }
            }

            var d = GetDefaultGroup();
            d.ObjectsToCull.Add(obj);
        }

        public static void RemoveObject([CanBeNull] CullingObject obj)
        {
            if (obj == null)
                return;

            for (var index0 = 0; index0 < CullingGroups.Count; index0++)
                CullingGroups[index0].ObjectsToCull.Remove(obj);
        }

        public static void AddGroup([NotNull] CullingRegion region)
        {
            if (region == null) throw new ArgumentNullException(nameof(region));
            for (var index0 = 0; index0 < CullingGroups.Count; index0++)
            {
                var group = CullingGroups[index0];
                if (group.region == region)
                    return;
            }

            var newGroup = new CullingGroup { region = region };
            CullingGroups.Add(newGroup);

            var defaultGroup = GetDefaultGroup();
            for (var index0 = 0; index0 < defaultGroup.ObjectsToCull.Count; index0++)
            {
                var obj = defaultGroup.ObjectsToCull[index0];
                if (obj.Dynamic)
                    continue;

                if (newGroup.region.Contains(obj.transform.position))
                    newGroup.ObjectsToCull.Add(obj);
            }
        }

        public static void RemoveGroup([CanBeNull] CullingRegion region)
        {
            if (region == null) return;
            for (var index0 = 0; index0 < CullingGroups.Count; index0++)
            {
                var group = CullingGroups[index0];
                if (group.region == region)
                {
                    var defaultGroup = GetDefaultGroup();
                    defaultGroup.ObjectsToCull.AddRange(group.ObjectsToCull);
                    CullingGroups.RemoveAt(index0);
                    return;
                }
            }
        }

        private static CullingGroup GetDefaultGroup()
        {
            if (DefaultCullingGroup == null)
            {
                DefaultCullingGroup = new CullingGroup { isDefault = true };
                CullingGroups.Add(DefaultCullingGroup);
            }

            return DefaultCullingGroup;
        }

        public static bool SuppressCulling { get; set; } = false;

        private static readonly List<CullingObject> CullingCache = new(64);
        [ShowInInspector] public static readonly List<CullingGroup> CullingGroups = new(32);
        private static CullingGroup DefaultCullingGroup;
    }
}
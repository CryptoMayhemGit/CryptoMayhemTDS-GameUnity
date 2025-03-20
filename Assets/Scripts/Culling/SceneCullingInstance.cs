using System.Collections.Generic;
using JetBrains.Annotations;
using Pooling;
using Sirenix.OdinInspector;
using UnityEngine;
using Utility;

namespace Culling
{
    public enum CullingType
    {
        Default = 0,
    }

    [HideMonoScript, DisallowMultipleComponent, DefaultExecutionOrder(-99999)]
    public sealed class SceneCullingInstance : MonoBehaviour
    {
        public CullingType type = CullingType.Default;
        public float treeWidth = 10;
        public float treeHeight = 10;

        public readonly List<CullingObject> InsideFrustum = new();

        private void Awake()
        {
            var p = transform.position;
            Scenes.Add(this);

            RaycastPooling.Setup((Vector2)p, treeWidth, treeHeight);
        }

        private void OnDestroy()
        {
            Scenes.Remove(this);

            RaycastPooling.Dispose();
        }

        [Button]
        public void ApplySceneSize()
        {
            CullingUtility.GetSceneWidthAndHeight(gameObject.scene, out var x, out var z, out var width,
                out var height);
            transform.position = new Vector3(x, 0f, z);
            treeWidth = width;
            treeHeight = height;
        }

        public void ApplySceneSizeAll()
        {
            CullingUtility.GetSceneWidthAndHeightBackup(gameObject.scene, out var x, out var z, out var width,
                out var height);
            transform.position = new Vector3(x, 0f, z);
            treeWidth = width;
            treeHeight = height;
        }

        [Button]
        public bool ApplySceneSizeFromPlayZone()
        {
            if (CullingUtility.GetSceneWidthAndHeightFromPlayZone(gameObject.scene, out var x, out var z, out var width,
                    out var height))
            {
                transform.position = new Vector3(x, 0f, z);
                treeWidth = width;
                treeHeight = height;
                return true;
            }

            Debug.LogWarning("Cannot find play zone in scene.", this);
            return false;
        }

        [CanBeNull]
        public static SceneCullingInstance GetCullingInstance(CullingType type)
        {
            for (var index0 = 0; index0 < Scenes.Count; index0++)
            {
                var scene = Scenes[index0];
                if (scene.type == type)
                    return scene;
            }

            return default;
        }

        public static readonly List<SceneCullingInstance> Scenes = new();
    }
}
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    public enum CullingMode
    {
        /// <summary>
        ///     Object gets culled when gets outside of the camera frustum.
        /// </summary>
        ScreenProximity,

        /// <summary>
        ///     Object gets culled when gets far enough from player.
        /// </summary>
        PlayerProximity
    }

    public enum CullingOverlapMode
    {
        Point,
        Box
    }

    [HideMonoScript, DisallowMultipleComponent, DefaultExecutionOrder(-9999)]
    public sealed partial class CullingObject : MonoBehaviour
    {
        public CullingMode mode = CullingMode.ScreenProximity;
        public CullingOverlapMode overlap = CullingOverlapMode.Point;

        [Indent, ShowIf(nameof(overlap), CullingOverlapMode.Box)]
        public Vector3 overlapOffset = new(0, 0, 0);

        [Indent, ShowIf(nameof(overlap), CullingOverlapMode.Box)]
        public Vector3 overlapSize = new(4, 0, 4);

        public CullingType type = CullingType.Default;

        [SerializeField] private bool dynamic = true;

        public bool perPlatform;
        [ShowIf(nameof(perPlatform))] public event Action OnFrustumState;

        public bool Dynamic
        {
            get => dynamic;
            set
            {
                dynamic = value;
                if (value)
                {
                    if (!DynamicInstances.Contains(this))
                        DynamicInstances.Add(this);
                }
                else DynamicInstances.Remove(this);
            }
        }

        [ShowInInspector, ReadOnly] public bool InFrustum { get; private set; } = false;

        private bool hasRect;
        private CullingProcessor.FrustumStruct objectRect;
        private Vector3 halfOverlapSize;

        private void OnEnable()
        {
            halfOverlapSize = overlapSize / 2f;

            ReadjustRect();

            if (Application.isEditor || dynamic)
                DynamicInstances.Add(this);
            CullingProcessor.AddObject(this);
        }

        private void OnDisable()
        {
            DynamicInstances.Remove(this);

            CullingProcessor.RemoveObject(this);
        }

        public void ForceUpdateRegion()
        {
            OnDisable();
            OnEnable();
        }

        private void OnDestroy()
        {
            CullingProcessor.RemoveObject(this);
        }

        public void FixedUpdateObject()
        {
            ReadjustRect();
        }

        public void SetFrustumState(bool state)
        {
            if (InFrustum == state)
                return;

            InFrustum = state;
            OnFrustumState?.Invoke();
        }

        private void ReadjustRect()
        {
            if (hasRect)
            {
                var position = transform.position - halfOverlapSize + transform.TransformDirection(overlapOffset);
                objectRect = new CullingProcessor.FrustumStruct(position.x, position.z, 0f, 0f);
            }
            else
            {
                hasRect = true;
                var position = transform.position - halfOverlapSize + transform.TransformDirection(overlapOffset);
                objectRect = new CullingProcessor.FrustumStruct(position.x, position.z, overlapSize.x, overlapSize.z);
            }
        }

        public bool IsOnScreen([NotNull] CullingProcessor.FrustumStruct cameraFrustum)
        {
            switch (overlap)
            {
                case CullingOverlapMode.Point:
                    return cameraFrustum.Contains(transform.position);
                case CullingOverlapMode.Box:
                    return cameraFrustum.Overlaps(objectRect);
                default:
                    throw new ArgumentOutOfRangeException(nameof(overlap), overlap, null);
            }
        }

        public static readonly List<CullingObject> DynamicInstances = new(128);
    }
}
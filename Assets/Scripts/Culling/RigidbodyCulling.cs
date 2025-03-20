using System;
using Extensions;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    public enum RigidbodyCullingMode
    {
        CullInterpolationOnly,
        CullFullSimulation
    }

    [HideMonoScript, DisallowMultipleComponent]
    [RequireComponent(typeof(Rigidbody2D))]
    public sealed class RigidbodyCulling : MonoBehaviour
    {
        public RigidbodyCullingMode cullingMode = RigidbodyCullingMode.CullInterpolationOnly;

        private CullingObject Object { get; set; }
        private Rigidbody2D Rigidbody { get; set; }

        private RigidbodyInterpolation2D formerInterpolation;

        private void Awake()
        {
            if (Application.isPlaying)
                Object = gameObject.GetComponentInAnyParent<CullingObject>(true);

            if (Object == null)
                return;

            Object.OnFrustumState += Refresh;
            Rigidbody = gameObject.GetComponent<Rigidbody2D>();
            formerInterpolation = Rigidbody.interpolation;
        }

        private void OnDestroy()
        {
            if (Object != null)
                Object.OnFrustumState -= Refresh;
        }

        private void OnEnable()
        {
            Refresh();
        }

        private void Refresh()
        {
            if (Rigidbody == null)
                return;

            switch (cullingMode)
            {
                case RigidbodyCullingMode.CullInterpolationOnly:
                    Rigidbody.interpolation = Object.InFrustum ? formerInterpolation : RigidbodyInterpolation2D.None;
                    break;
                case RigidbodyCullingMode.CullFullSimulation:
                    Rigidbody.simulated = Object.InFrustum;
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
    }
}
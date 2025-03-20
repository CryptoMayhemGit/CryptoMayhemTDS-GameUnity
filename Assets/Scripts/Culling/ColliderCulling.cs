using Extensions;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    [HideMonoScript, DisallowMultipleComponent]
    [RequireComponent(typeof(Collider))]
    public sealed class ColliderCulling : MonoBehaviour
    {
        private CullingObject Object { get; set; }
        private Collider Collider { get; set; }

        private void Awake()
        {
            if (Application.isPlaying)
                Object = gameObject.GetComponentInAnyParent<CullingObject>(true);

            if (Object == null)
                return;

            Object.OnFrustumState += Refresh;
            Collider = gameObject.GetComponent<Collider>();
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
            if (Collider == null)
                return;

            Collider.enabled = Object.InFrustum;
        }

        public Collider GetCollider()
        {
            return Collider;
        }
    }
}
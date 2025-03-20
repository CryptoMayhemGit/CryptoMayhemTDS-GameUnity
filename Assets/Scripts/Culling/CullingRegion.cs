using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    /// <summary>
    ///     Allows you to exclude any culling object from updates if camera is too far from the center of region.
    /// </summary>
    /// <remarks>
    ///     Works only for non-dynamic culling objects.
    /// </remarks>
    [HideMonoScript, DisallowMultipleComponent]
    public sealed partial class CullingRegion : MonoBehaviour
    {
        public Vector3 size;
        public float distance = 48f;

        private CullingProcessor.FrustumStruct Bounds { get; set; }
        public Vector2 Point { get; private set; }

        private void OnEnable()
        {
            CullingProcessor.AddGroup(this);

            Bounds = new CullingProcessor.FrustumStruct(transform.position.x - size.x / 2,
                transform.position.z - size.z / 2, size.x, size.z);
            Point = transform.position;
        }

        private void OnDisable()
        {
            CullingProcessor.RemoveGroup(this);
        }

        private void OnDestroy()
        {
            CullingProcessor.RemoveGroup(this);
        }

        public bool Contains(in Vector2 point)
        {
            return Bounds.Contains(point);
        }
    }
}
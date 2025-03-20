using JetBrains.Annotations;
using UnityEngine;

namespace Utility
{
    /// <summary>
    ///     Set of utility methods: <see cref="Bounds"/>
    /// </summary>
    public static class BoundsUtility
    {
        /// <summary>
        ///     Returns all 8 corners of bounds in array.
        /// </summary>
        [NotNull]
        public static Vector3[] GetCorners(in Bounds bounds)
        {
            var c = new Vector3[8];
            c[0] = bounds.min;
            c[1] = bounds.max;
            c[2] = new Vector3(c[1].x, c[1].y, c[2].z);
            c[3] = new Vector3(c[1].x, c[2].y, c[1].z);
            c[4] = new Vector3(c[2].x, c[1].y, c[1].z);
            c[5] = new Vector3(c[1].x, c[2].y, c[2].z);
            c[6] = new Vector3(c[2].x, c[1].y, c[2].z);
            c[7] = new Vector3(c[2].x, c[2].y, c[1].z);
            return c;
        }

        /// <summary>
        ///     Generates <see cref="Bounds"/> from array of <see cref="Renderer"/> based components.
        /// </summary>
        public static Bounds BoundsFromRenderers<T>([CanBeNull] params T[] renderers) where T : Renderer
        {
            if (renderers == null || renderers.Length == 0)
                return default;

            var bounds = renderers[0].bounds;
            if (bounds == default)
                return default;

            for (var index0 = 1; index0 < renderers.Length; index0++)
            {
                var r = renderers[index0];
                if (r == null)
                    continue;
                bounds.Encapsulate(r.bounds.min);
                bounds.Encapsulate(r.bounds.max);
            }

            return bounds;
        }

        /// <summary>
        ///     Generates <see cref="Bounds"/> from array of <see cref="Collider"/> based components.
        /// </summary>
        public static Bounds BoundsFromColliders<T>([CanBeNull] T[] colliders) where T : Collider
        {
            if (colliders == null || colliders.Length == 0)
                return default;

            var bounds = colliders[0].bounds;
            if (bounds == default)
                return default;

            for (var index0 = 1; index0 < colliders.Length; index0++)
            {
                var r = colliders[index0];
                if (r == null)
                    continue;
                bounds.Encapsulate(r.bounds.min);
                bounds.Encapsulate(r.bounds.max);
            }

            return bounds;
        }
        
        /// <summary>
        ///     Generates <see cref="Bounds"/> from array of <see cref="Collider2D"/> based components.
        /// </summary>
        public static Bounds BoundsFromColliders2D<T>([CanBeNull] T[] colliders) where T : Collider2D
        {
            if (colliders == null || colliders.Length == 0 || colliders[0] == null)
                return default;

            var bounds = colliders[0].bounds;
            if (bounds == default)
                return default;

            for (var index = 1; index < colliders.Length; index++)
            {
                var r = colliders[index];
                if (r == null)
                    continue;
                bounds.Encapsulate(r.bounds.min);
                bounds.Encapsulate(r.bounds.max);
            }

            return bounds;
        }

        /// <summary>
        ///     Generates <see cref="Bounds"/> from array of <see cref="Mesh"/>es.
        /// </summary>
        public static Bounds BoundsFromMeshes([CanBeNull] Mesh[] meshes)
        {
            if (meshes == null || meshes.Length == 0)
                return default;

            var bounds = meshes[0].bounds;
            if (bounds == default)
                return default;

            for (var index = 1; index < meshes.Length; index++)
            {
                var r = meshes[index];
                if (r == null)
                    continue;
                bounds.Encapsulate(r.bounds.min);
                bounds.Encapsulate(r.bounds.max);
            }

            return bounds;
        }
    }
}
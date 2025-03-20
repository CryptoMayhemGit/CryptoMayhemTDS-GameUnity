using System;
using JetBrains.Annotations;
using UnityEngine;

namespace Extensions
{
    /// <summary>
    ///     Set of utility methods: <see cref="Transform"/>
    /// </summary>
    public static class ExtensionTransform
    {
        public static string GetRelativeParentPath(this Transform t, Transform maxParent)
        {
            if (t == null)
                return "";
            if (t.parent == null)
                return t.name;
            if (t.parent == maxParent)
                return t.name;
            return t.parent.GetRelativeParentPath(maxParent) + "/" + t.name;
        }
        
        [NotNull]
        public static string GetParentPath([NotNull] this Transform t, in bool includeSiblingIndex = false)
        {
            if (t == null) throw new ArgumentNullException(nameof(t));
            var path = string.Empty;
            var p = t.parent;
            while (p != null)
            {
                path = $@"\{p.name}{path}";
                p = p.parent;
            }

            path = path + $@"\{t.name}";
            path = path.Remove(0, 1);
            if (includeSiblingIndex)
                path += $":{t.GetSiblingIndex()}";

            return path;
        }
        
        public static bool HasParentOfName([NotNull] this Transform t, [NotNull] string parentName, in bool contains = false)
        {
            if (t == null) throw new ArgumentNullException(nameof(t));
            if (parentName == null) throw new ArgumentNullException(nameof(parentName));
            
            var p = t.parent;
            while (p != null)
            {
                if (contains)
                {
                    if (p.name.Contains(parentName))
                        return true;
                }
                else
                {
                    if (p.name == parentName)
                        return true;
                }
                
                p = p.parent;
            }

            return false;
        }
        
        /// <summary>
        ///     Sets the angle (z of euler) of transform.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static void SetAngleXY([NotNull] this Transform transform, float angle)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            var eulerAngles = transform.eulerAngles;
            eulerAngles = new Vector3(eulerAngles.x, eulerAngles.y, angle);
            transform.eulerAngles = eulerAngles;
        }

        /// <summary>
        ///     Sets the local angle (z of local euler) of transform.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static void SetLocalAngleXY([NotNull] this Transform transform, float angle)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            var localEulerAngles = transform.localEulerAngles;
            localEulerAngles = new Vector3(localEulerAngles.x, localEulerAngles.y, angle);
            transform.localEulerAngles = localEulerAngles;
        }

        /// <summary>
        ///     Gets the angle (z of euler) of transform.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static float GetAngleXY([NotNull] this Transform transform)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            return transform.eulerAngles.z;
        }

        /// <summary>
        ///     Gets the local angle (z of local euler) of transform.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static float GetLocalAngleXY([NotNull] this Transform transform)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            return transform.localEulerAngles.z;
        }

        /// <summary>
        ///     Returns distance between this and target localScale.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static float ScaleDistance2D([NotNull] this Transform transform, Vector2 target)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            if (target == null) throw new ArgumentNullException(nameof(target));
            return Vector2.Distance(transform.localScale, target);
        }

        /// <summary>
        ///     Resets localPosition, localRotation and localScale to default.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static void ResetLocalTransform([NotNull] this Transform transform)
        {
            if (transform == null) throw new ArgumentNullException(nameof(transform));
            transform.localPosition = Vector3.zero;
            transform.localRotation = Quaternion.identity;
            transform.localScale = Vector3.one;
        }
    }
}
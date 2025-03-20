namespace Culling
{
    using UnityEngine;

    public sealed partial class CullingRegion
    {
        public static readonly Color Active_SolidColor = new Color(0f, 0.5f, 0.1f, 1f);
        public static readonly Color Active_TransparentColor = new Color(0f, 0.5f, 0.1f, 0.1f);

        public static readonly Color Culled_SolidColor = new Color(1f, 0.0f, 0.1f, 1f);
        public static readonly Color Culled_TransparentColor = new Color(1f, 0.0f, 0.1f, 0.1f);

        public static readonly Color Neutral_SolidColor = new Color(1f, 0.5f, 0.1f, 1f);
        public static readonly Color Neutral_TransparentColor = new Color(1f, 0.5f, 0.1f, 0.1f);

        private void OnDrawGizmos()
        {
            if (Application.isPlaying)
            {
                CullingGroup g = null;
                foreach (var c in CullingProcessor.CullingGroups)
                {
                    if (c.region == this)
                    {
                        g = c;
                        break;
                    }
                }

                if (g != null)
                {
                    Gizmos.color = g.isActive ? Active_TransparentColor : Culled_TransparentColor;
                    Gizmos.DrawCube(transform.position, new Vector3(size.x, 0, size.z));

                    Gizmos.color = g.isActive ? Active_SolidColor : Culled_SolidColor;
                    Gizmos.DrawWireCube(transform.position, new Vector3(size.x, 0, size.z));
                }
            }
            else
            {
                Gizmos.color = Neutral_TransparentColor;
                Gizmos.DrawCube(transform.position, new Vector3(size.x, 0, size.z));

                Gizmos.color = Neutral_SolidColor;
                Gizmos.DrawWireCube(transform.position, new Vector3(size.x, 0, size.z));
            }
        }
    }
}
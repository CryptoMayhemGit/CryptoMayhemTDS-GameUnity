#if UNITY_EDITOR

using System;
using UnityEditor;
using UnityEngine;

namespace Culling
{
    public sealed partial class CullingObject
    {
        private void OnDrawGizmos()
        {
            switch (overlap)
            {
                case CullingOverlapMode.Point:
                    break;
                case CullingOverlapMode.Box:
                    if (!Application.isPlaying)
                    {
                        hasRect = false;
                        halfOverlapSize = overlapSize / 2f;
                    }

                    ReadjustRect();
                    Gizmos.color = Color.cyan;
                    Gizmos.DrawWireCube(objectRect.center, objectRect.size);
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }

            if (Application.isPlaying && !InFrustum)
            {
                switch (mode)
                {
                    case CullingMode.ScreenProximity:
                        Gizmos.color = Color.magenta;
                        Gizmos.DrawCube(transform.position, new Vector3(2f, 0f, 2f));
                        Handles.Label(transform.position, "Outside camera frustum!");
                        break;
                    case CullingMode.PlayerProximity:
                        Gizmos.color = Color.cyan;
                        Gizmos.DrawCube(transform.position, new Vector3(2f, 0f, 2f));
                        Handles.Label(transform.position, "Outside player frustum!");
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
        }
    }
}

#endif
using System;
using System.Runtime.CompilerServices;
using Culling;
using Extensions;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Utility
{
    public static class CullingUtility
    {
        [MethodImpl((MethodImplOptions) 256)]
        public static float Distance(Vector3 a, Vector3 b)
        {
            var num1 = a.x - b.x;
            var num2 = a.z - b.z;
            return (float) Math.Sqrt(num1 * (double) num1 + num2 * (double) num2);
        }
        
        [MethodImpl((MethodImplOptions) 256)]
        public static float Distance(Vector3 a, Vector2 b)
        {
            var num1 = a.x - b.x;
            var num2 = a.y - b.y;
            return (float) Math.Sqrt(num1 * (double) num1 + num2 * (double) num2);
        }

        public static void GetSceneWidthAndHeightBackup(Scene scene,out float x, out float z, out float width, out float height)
        {
            var allRenderers = scene.GetComponentsOfType<MeshRenderer>(true);
            var bounds = BoundsUtility.BoundsFromRenderers(allRenderers);
    
            x = bounds.center.x - bounds.extents.x;
            z = bounds.center.z - bounds.extents.z;
            
            width = bounds.size.x;
            height = bounds.size.z;
        }
        
        public static void GetSceneWidthAndHeight(Scene scene, out float x, out float z, out float width, out float height)
        {
            var allRenderers = scene.GetComponentsOfType<MeshRenderer>(true);
            var bounds = BoundsUtility.BoundsFromRenderers(allRenderers);
    
            x = bounds.center.x - bounds.extents.x;
            z = bounds.center.z - bounds.extents.z;
            
            width = bounds.size.x;
            height = bounds.size.z;
        }
        
        public static bool GetSceneWidthAndHeightFromPlayZone(Scene scene, out float x, out float z, out float width, out float height)
        {
            x = 0f;
            z = 0f;
            width = 0f;
            height = 0f;
            
            var playZones = scene.GetComponentsOfType<PlayZone>(true);
            if (playZones.Length == 0)
                return false;
            
            var bounds = playZones[0].GenerateBounds();
            foreach (var p in playZones)
            {
                var other = p.GenerateBounds();
                bounds.Encapsulate(other);
            }
    
            x = bounds.center.x - bounds.extents.x;
            z = bounds.center.z - bounds.extents.z;
            
            width = bounds.size.x;
            height = bounds.size.z;
            return true;
        }
    }
}
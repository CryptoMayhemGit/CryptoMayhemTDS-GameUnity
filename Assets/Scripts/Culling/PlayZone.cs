using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    /// <summary>
    ///     Zone that defines playable area player need to be in.
    /// </summary>
    /// <remarks>
    ///     If player is not in any play zone, he will be immediately executed. 
    /// </remarks>
    [ExecuteInEditMode, InfoBox("Defines a 'playable/gameplay' zone. If player is not present in any, he will be executed immediately.")]
    [HideMonoScript, DisallowMultipleComponent, DefaultExecutionOrder(-999999)]
    public sealed class PlayZone : MonoBehaviour
    {
        public Vector3 size;
        
        /// <summary>
        ///     Bounds of the play zone.
        /// </summary>
        private Bounds Bounds { get; set; }

        private void OnEnable()
        {
            Bounds = GenerateBounds();
            
            PlayZoneManager.PlayZones.Add(this);
        }

        private void OnDisable()
        {
            PlayZoneManager.PlayZones.Remove(this);
        }

        private void OnDestroy()
        {
            PlayZoneManager.PlayZones.Remove(this);
        }

        public Bounds GenerateBounds()
        {
            return new Bounds(transform.position, new Vector3(size.x, 0, size.z));
        }
        
        public bool IsInsideZone(Vector3 point)
        {
            return Bounds.Contains(point);
        }
        
        private static readonly Color SolidColor = new(1f, 0f, 0f, 1f);
        private static readonly Color FillColor = new(1f, 0f, 0f, 0.1f);
        
        private void OnDrawGizmosSelected()
        {
            var point = transform.position;
            Gizmos.color = SolidColor;
            Gizmos.DrawWireCube(point, new Vector3(size.x,0,size.z));
            
            Gizmos.color = FillColor;
            Gizmos.DrawCube(point, new Vector3(size.x,0,size.z));
        }
    }
}
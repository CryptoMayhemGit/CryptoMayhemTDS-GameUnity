using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    [HideMonoScript, CreateAssetMenu(fileName = "CullingProcessorProfile", menuName = "Culling/Culling Processor Profile", order = 0)]
    public sealed class CullingProcessorProfile : ScriptableObject
    {
        
        [Title("Camera Frustum")]
        public float cameraFrustumHeight = 35f;
        public float cameraFrustumWidth = 55f;

        [Title("Player Frustum")]
        public float playerFrustumHeight = 16f;
        public float playerFrustumWidth = 8f;
    }
}
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    [HideMonoScript, DisallowMultipleComponent]
    public sealed class CullingPlayerProximityEmitter : MonoBehaviour
    {
        public CullingProcessor.FrustumStruct Frustum { get; private set; }

        private void OnEnable()
        {
            Emitters.Add(this);
        }

        private void OnDisable()
        {
            Emitters.Remove(this);
        }

        public void FixedUpdateEmitter()
        {
            var processor = CullingProcessor.Instance;
            if (processor == null)
            {
                return;
            }

            var profile = processor.GetProfile();
            if (processor == null)
            {
                return;
            }

            var playerPoint = transform.position;
            Frustum = new CullingProcessor.FrustumStruct(
                playerPoint.x - profile.playerFrustumWidth / 2f,
                playerPoint.z - profile.playerFrustumHeight / 2f,
                profile.playerFrustumWidth,
                profile.playerFrustumHeight
            );
        }

        public static readonly List<CullingPlayerProximityEmitter> Emitters = new(2);
    }
}
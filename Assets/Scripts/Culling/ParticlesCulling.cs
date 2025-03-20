using Extensions;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.VFX;

namespace Culling
{
    [HideMonoScript, DisallowMultipleComponent]
    public sealed class ParticlesCulling : MonoBehaviour
    {
        private CullingObject Object { get; set; }
        
        private ParticleSystem ParticleSystem { get; set; }
        private VisualEffect VisualEffect { get; set; }
        
        private void Awake()
        {
            if (Application.isPlaying)
                Object = gameObject.GetComponentInAnyParent<CullingObject>(true);

            if (Object == null)
                return;
            
            Object.OnFrustumState += Refresh;

            ParticleSystem = gameObject.GetComponent<ParticleSystem>();
            VisualEffect = gameObject.GetComponent<VisualEffect>();
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
            if (ParticleSystem != null)
                ParticleSystem.SetActive(Object.InFrustum);
            if (VisualEffect != null)
                VisualEffect.SetActive(Object.InFrustum);
        }   
    }
}
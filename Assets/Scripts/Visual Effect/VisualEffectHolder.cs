using Assets.Scripts.Pooling;
using UnityEngine;

namespace Assets.Scripts.VisualEffect
{
    public class VisualEffectHolder : MonoBehaviour
    {
        [SerializeField] private ParticleSystem particle = null;
        
        public Transform DefaultParent { get; private set; }

        Transform Transform;
        VisualEffectsPool pool;

        public void Init(VisualEffectsPool pool)
        {
            Transform = transform;
            this.pool = pool;
        }

        [ContextMenu("Play")]
        public void Play()
        {
            particle.Play();
        }

        public void Play(Vector3 position) => Play(position, Quaternion.identity, null);

        public void Play(Vector3 position, Quaternion rotation, Transform newParent)
        {
            Transform.SetPositionAndRotation(position, rotation);
            if (newParent != null) Transform.parent = newParent;
            particle.Play();
        }

        private void OnParticleSystemStopped()
        {
            Transform.parent = pool.DefaultParent;
            pool.ReturnToPool(this);
        }
    }
}
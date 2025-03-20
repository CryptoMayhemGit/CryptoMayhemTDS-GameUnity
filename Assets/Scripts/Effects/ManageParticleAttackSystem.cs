using Assets.Scripts.Containers;
using Assets.Scripts.Weapons;
using UnityEngine;

namespace Assets.Scripts.Effects
{
    [RequireComponent(typeof(ParticleSystem))]
    public class ManageParticleAttackSystem : MonoBehaviour
    {
        [SerializeField] private ParticleSystem particleSystem = null;
        public ParticleSystem ParticleSystem => particleSystem;
        private ParticleWeapon particleWeapon;

        void OnParticleCollision(GameObject other)
        {
            if (other.TryGetComponent(out EnemyContainer enemyContainer))
            {
                particleWeapon.OnHit.Invoke(enemyContainer);
            }
        }

        public void SetParticleWeapon(ParticleWeapon particleWeapon)
        {
            this.particleWeapon = particleWeapon;
        }
    }
}

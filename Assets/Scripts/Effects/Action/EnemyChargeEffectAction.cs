using Assets.Scripts.Containers;
using Assets.Scripts.Movement.Dash;
using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class EnemyChargeEffectAction : EffectAction
    {
        [SerializeField] private SerializedDictionary<Assets.Scripts.Damage.DamageType, float> damageTypes = new();

        public override void Begin(CharacterContainer container) => container.DashCollisionDetector.OnCollision += OnCollision;
        public override void End(CharacterContainer container) => container.DashCollisionDetector.OnCollision -= OnCollision;

        private void OnCollision(CharacterContainer container)
        {
            foreach (var item in damageTypes)
            {
                container.Health.DealDamage(item.Key, item.Value);
            }
        }
    }
}
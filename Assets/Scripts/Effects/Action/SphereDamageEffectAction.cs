using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class SphereDamageEffectAction : EffectAction
    {
        [SerializeField, Min(0.5f)] private float radius = 2f;
        [SerializeField] private LayerMask targetLayer = default;
        [SerializeField] private SerializedDictionary<Damage.DamageType, float> damageTypes = new();

        public override void Tick(CharacterContainer container)
        {
            Collider[] hits = Physics.OverlapSphere(container.Transform.position, radius, targetLayer);

            foreach (var hit in hits)
                foreach (var damage in damageTypes)
                    hit.GetComponent<CharacterContainer>().Health.DealDamage(damage.Key, damage.Value);
        }
    }
}
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class DealDamageInRadiusSkillAction : SkillAction
    {
        [SerializeField, Min(0.1f)] private float radius = 2f;
        [SerializeField] private LayerMask targetLayer = default;
        [SerializeField] private SerializedDictionary<Damage.DamageType, float> damageTypes = new();

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            CharacterContainer container;

            foreach (Collider collider in Physics.OverlapSphere(targetPosition, radius, targetLayer))
            {
                container = collider.GetComponent<CharacterContainer>();
                foreach (var damage in damageTypes)
                    container.Health.DealDamage(damage.Key, damage.Value);
            }
        }
    }
}
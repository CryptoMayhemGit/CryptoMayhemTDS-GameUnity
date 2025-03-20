using Assets.Scripts.Containers;
using Assets.Scripts.Damage;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class EnemyMeleeSkillAction : SkillAction
    {
        [SerializeField] private SerializedDictionary<DamageType, float> damageTypes = new();
        [UnityEngine.SerializeField] private Sound.CharacterHitBy hitBy = Sound.CharacterHitBy.Default;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {                        
            foreach (var item in damageTypes)
                ((IAIContainer)origin).TargetSearcher.ClosestTarget.Health.DealDamage(item.Key, item.Value, hitBy);
        }
    }
}
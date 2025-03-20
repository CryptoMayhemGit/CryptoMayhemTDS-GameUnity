using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class DealDamageOverTimeEffectAction : EffectAction
    {
        [SerializeField] private SerializedDictionary<Assets.Scripts.Damage.DamageType, float> damageTypes = new();

        public override void Tick(Containers.CharacterContainer container)
        {
            foreach (var item in damageTypes)
            {
                container.Health.DealDamage(item.Key, item.Value);
            }
        }
    }
}
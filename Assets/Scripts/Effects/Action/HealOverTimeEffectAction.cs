using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class HealOverTimeEffectAction : EffectAction
    {
        [SerializeField, Min(1f)] private float healAmount = 1f;

        public override void Tick(Containers.CharacterContainer container)
        {
            container.Health.Heal(healAmount);
        }
    }
}
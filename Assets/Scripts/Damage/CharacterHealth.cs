using Assets.Scripts.Containers;
using Assets.Scripts.Stats;
using System;
using UnityEngine;

namespace Assets.Scripts.Damage
{
    public class CharacterHealth : CharacterComponent
    {
        [SerializeField] private CharacterContainer character = null;
        [SerializeField] private CachedDynamicStat[] stats = new CachedDynamicStat[0];
        [SerializeField] private UltEvents.UltEvent onHit = new();

        private int immortalityCounter;

        public event Action OnHit;

        public void AddImmortalFactor()
        {
            immortalityCounter++;
        }

        public void RemoveImmortalFactor()
        {
            immortalityCounter--;
        }

        public void DealDamage(DamageType damageType, float amount, Sound.CharacterHitBy hitBy = Sound.CharacterHitBy.Default)
        {
            if (immortalityCounter > 0)
                return;

            float damageToDeal = amount;

            for (int i = 0; i < stats.Length; i++)
            {
                float diff = stats[i].Get().DynamicValue - damageToDeal;
                stats[i].Get().ModifyDynamicValue(-damageToDeal);
                damageToDeal = -diff;

                if (diff >= 0f)
                    break;
            }

            OnHit?.Invoke();
            onHit.Invoke();
            character.Sounds.PlayHit(hitBy);

            if (stats[^1].Get().DynamicValue == 0f)
            {
                character.Despawn();
                character.Sounds.PlayDeath();
            }
        }

        public void Heal(float amount) => stats[^1].Get().ModifyDynamicValue(amount);
    }
}
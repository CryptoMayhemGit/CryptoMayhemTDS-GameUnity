using UnityEngine;

namespace Assets.Scripts.Weapons
{
    [System.Serializable]
    public class WeaponDamage
    {
        [SerializeField, Min(1f)] private float damage = 1f;
        [SerializeField, Min(0.01f)] private float criticalMultiplier = 0.01f;
        [SerializeField, Min(0f)] private float criticalHitChance = 0f;

        public float GetDamage()
        {
            return criticalHitChance > Random.value ? damage * criticalMultiplier : damage;
        }
    }
}
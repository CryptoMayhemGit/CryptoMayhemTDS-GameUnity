using UnityEngine;

namespace Assets.Scripts.Spawnable.MineActions
{
    public class DealDamageMineAction : MineAction
    {
        [SerializeField] private SerializedDictionary<Assets.Scripts.Damage.DamageType, float> damageTypes = new();

        public override void Trigger(Containers.CharacterContainer unit)
        {
            foreach (var item in damageTypes)
            {
                unit.Health.DealDamage(item.Key, item.Value);
            }
        }
    }
}
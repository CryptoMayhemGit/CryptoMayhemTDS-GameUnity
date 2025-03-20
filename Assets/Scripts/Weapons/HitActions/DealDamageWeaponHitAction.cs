using Assets.Scripts.Containers;

namespace Assets.Scripts.Weapons.HitActions
{
    public class DealDamageWeaponHitAction : HitAction
    {
        [UnityEngine.SerializeField] private SerializedDictionary<Damage.DamageType, WeaponDamage> damageTypes = new();
        [UnityEngine.SerializeField] private Sound.CharacterHitBy hitBy = Sound.CharacterHitBy.Default;

        public override void OnHit(CharacterContainer owner, CharacterContainer target)
        {
            foreach (var type in damageTypes)
                target.Health.DealDamage(type.Key, type.Value.GetDamage(), hitBy);
        }
    }
}
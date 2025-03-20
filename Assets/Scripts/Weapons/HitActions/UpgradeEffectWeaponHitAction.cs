using Assets.Scripts.Containers;
using Assets.Scripts.Effects;
using UnityEngine;

namespace Assets.Scripts.Weapons.HitActions
{
    public class UpgradeEffectWeaponHitAction : HitAction
    {
        [SerializeField] private Effect required = null;
        [SerializeField] private Effect upgrade = null;

        public override void OnHit(CharacterContainer owner, CharacterContainer target)
        {
            if (target.Effects.Contains(required))
                target.Effects.AddEffect(upgrade);
        }
    }
}
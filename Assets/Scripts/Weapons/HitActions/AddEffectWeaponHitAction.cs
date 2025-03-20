using Assets.Scripts.Containers;

namespace Assets.Scripts.Weapons.HitActions
{
    public class AddEffectWeaponHitAction : HitAction
    {
        [UnityEngine.SerializeField] private Effects.Effect effect = null;

        public override void OnHit(CharacterContainer owner, CharacterContainer target)
        {
            target.Effects.AddEffect(effect);
        }
    }
}
using Assets.Scripts.Containers;

namespace Assets.Scripts.Weapons.HitActions
{
    [System.Serializable]
    public abstract class HitAction
    {
        public abstract void OnHit(CharacterContainer owner, CharacterContainer target);
    }
}
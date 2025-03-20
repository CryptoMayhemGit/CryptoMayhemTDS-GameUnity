using Assets.Scripts.Containers;

namespace Assets.Scripts.Effects.Action
{
    [System.Serializable]
    public abstract class EffectAction
    {
        public virtual void Begin(CharacterContainer container) { }
        public virtual void Tick(CharacterContainer container) { }
        public virtual void End(CharacterContainer container) { }
    }
}
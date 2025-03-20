using Assets.Scripts.Containers;

namespace Assets.Scripts.Effects.Action
{
    public class ModifyStatEffectAction : EffectAction
    {
        [UnityEngine.SerializeField] private Stats.StatModifier statModifier = new();

        public override void Begin(CharacterContainer container)
        {
            statModifier.Apply(container.Stats);
        }

        public override void End(CharacterContainer container)
        {
            statModifier.Misapply(container.Stats);
        }
    }
}
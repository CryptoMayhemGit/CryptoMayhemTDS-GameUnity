using Assets.Scripts.Containers;

namespace Assets.Scripts.Skills.Passive
{
    public class ModifyStatSkillPassive : SkillPassive
    {
        [UnityEngine.SerializeField] private Stats.StatModifier statModifier = new();

        public override void Activate(CharacterContainer origin) => statModifier.Apply(origin.Stats);
        public override void Deactivate(CharacterContainer origin) => statModifier.Misapply(origin.Stats);
    }
}
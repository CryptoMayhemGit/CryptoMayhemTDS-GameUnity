using Assets.Scripts.Containers;

namespace Assets.Scripts.Skills.Passive
{
    public class SetBoolVariableSkillPassive : SkillPassive
    {
        [UnityEngine.SerializeField] private BoolVariable boolVariable = null;

        public override void Activate(CharacterContainer origin) => boolVariable.Value = true;
        public override void Deactivate(CharacterContainer origin) => boolVariable.Value = false;
    }
}
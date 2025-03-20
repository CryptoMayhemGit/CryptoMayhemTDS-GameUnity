using Assets.Scripts.Containers;

namespace Assets.Scripts.Skills.Condition
{
    public class PlayerMovementSkillCondition : SkillCondition
    {
        public override bool Check(CharacterContainer character)
        {
            return ((PlayerContainer)character).Input.MovementDirection.sqrMagnitude != 0;
        }
    }
}
namespace Assets.Scripts.Skills.Condition
{
    [System.Serializable]
    public abstract class SkillCondition
    {
        public abstract bool Check(Containers.CharacterContainer character);
    }
}
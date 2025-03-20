using Assets.Scripts.Containers;

namespace Assets.Scripts.Skills.Passive
{
    [System.Serializable]
    public abstract class SkillPassive
    {
        public abstract void Activate(CharacterContainer origin);
        public abstract void Deactivate(CharacterContainer origin);
    }
}
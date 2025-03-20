using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Condition
{
    [System.Serializable]
    public abstract class AICondition
    {
        public abstract bool Check(CharacterContainer character);
    }
}
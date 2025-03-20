using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    [System.Serializable]
    public abstract class AIAction
    {
        public abstract void OnStart(CharacterContainer character);
        public abstract void OnUpdate(CharacterContainer character, float elapsedTime);
        public abstract void OnEnd(CharacterContainer character);
    }
}
namespace Assets.Scripts.Skills.Action
{
    [System.Serializable]
    public abstract class SkillAction
    {
        public abstract void Trigger(Containers.CharacterContainer origin, UnityEngine.Vector3 targetPosition);
    }
}
namespace Assets.Scripts.Manager
{
    public abstract class Manager : UnityEngine.ScriptableObject
    {
        public virtual void Init() { }
        public virtual void Enable() { }
        public virtual void Disable() { }
        public virtual void OnUpdate() { }
    }
}
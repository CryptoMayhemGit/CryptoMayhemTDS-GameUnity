namespace Assets.Scripts.Cooldowns
{
    public interface IUsable
    {
        float Cooldown { get; }
        UnityEngine.Sprite Sprite { get; }
    }
}
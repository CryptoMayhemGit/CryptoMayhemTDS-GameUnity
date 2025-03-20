namespace Assets.Scripts.Cooldowns
{
    public interface ICooldown
    {
        float CurrentTime { get; }
        float EndTime { get; }
    }
}
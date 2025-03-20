namespace Assets.Scripts.Weapons.Projectiles.MoveTypes
{
    [System.Serializable]
    public abstract class ProjectileMoveType
    {
        public abstract void Move(UnityEngine.Rigidbody rigidbody, float speed, float percentLifeTime);
    }
}
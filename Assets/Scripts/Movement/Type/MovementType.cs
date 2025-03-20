using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Movement.Type
{
    public abstract class MovementType : ScriptableObject
    {
        [field: SerializeField, Min(0.1f)] public float DashDuration { private set; get; } = 0.5f;
        [SerializeField, Min(1f)] protected float dashSpeed = 20f;
        [SerializeField] protected AnimationCurve dashSpeedMuliplier = new(new(0f, 1f), new(1f, 1f));
        [SerializeField, Min(1f)] protected float dashDamage = 1f;

        public abstract void Move(PlayerContainer player, Vector3 direction, float speed, float fixedDelta);
    }
}
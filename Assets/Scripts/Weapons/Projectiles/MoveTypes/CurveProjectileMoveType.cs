using UnityEngine;

namespace Assets.Scripts.Weapons.Projectiles.MoveTypes
{
    public class CurveProjectileMoveType : ProjectileMoveType
    {
        [SerializeField] private AnimationCurve xMovement = new(new(0, 0), new(1, 0));
        [SerializeField] private AnimationCurve zMovement = new(new(0, 1), new(1, 1));

        public override void Move(Rigidbody rigidbody, float speed, float percentLifeTime)
        {
            rigidbody.velocity = rigidbody.rotation * Quaternion.Euler(0, xMovement.Evaluate(percentLifeTime), 0) * Vector3.forward * (speed * zMovement.Evaluate(percentLifeTime));
        }
    }
}
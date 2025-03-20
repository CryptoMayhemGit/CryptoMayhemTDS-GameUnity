using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Movement.Type
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Movement Type/Tank")]
    public class TankMovementType : MovementType
    {
        [SerializeField] private float movementRotationSpeed = 300f;

        public override void Move(PlayerContainer player, Vector3 direction, float speed, float fixedDelta)
        {
            player.Rigidbody.MoveRotation(player.Rigidbody.rotation * Quaternion.Euler(0f, direction.x * movementRotationSpeed * fixedDelta, 0f));
            player.Rigidbody.velocity = player.Transform.forward * (direction.z * speed);
        }
    }
}
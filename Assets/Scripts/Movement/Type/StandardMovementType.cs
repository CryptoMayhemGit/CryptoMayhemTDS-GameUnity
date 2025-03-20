using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Movement.Type
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Movement Type/Standard")]
    public class StandardMovementType : MovementType
    {
        public override void Move(PlayerContainer player, Vector3 direction, float speed, float fixedDelta)
        {
            player.Rigidbody.velocity = direction * speed;
        }
    }
}
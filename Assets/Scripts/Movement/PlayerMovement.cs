using UnityEngine;

namespace Assets.Scripts.Movement
{
    public class PlayerMovement : CharacterComponent
    {
        [SerializeField] private Containers.PlayerContainer player = null;
        [SerializeField] private Stats.CachedStat movementSpeed = new();

        public void Move(float fixedDelta)
        {
            Vector3 direction = new Vector3(player.Input.MovementDirection.x, 0f, player.Input.MovementDirection.y);

            player.Inventory.MovementType.Move(
                    player,
                    player.CanMove() ? direction : Vector3.zero,
                    movementSpeed.Get().Value,
                    fixedDelta);

            player.AnimationController.SetMovementAnimation(direction);
        }
    }
}
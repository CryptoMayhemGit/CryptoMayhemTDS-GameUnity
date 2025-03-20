using UnityEngine;

namespace Assets.Scripts.StateMachine.State
{
    public class FallPlayerState : PlayerState
    {
        public FallPlayerState(Containers.PlayerContainer container) : base(container) { }

        public override void OnEnter() 
        {
            player.AnimationController.SetFallAnimation();
            player.Rigidbody.velocity = Vector3.zero;
        }
    }
}
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.StateMachine.State
{
    public class IdlePlayerState : PlayerState
    {
        public IdlePlayerState(PlayerContainer container, float timeBetweenIdles) : base(container) 
        {
            this.timeBetweenIdles = timeBetweenIdles;
        }

        private float timeBetweenIdles;
        private float timer;

        public override void OnEnter()
        {
            player.AnimationController.SetIsIdling(true);
            player.AnimationController.SetRandomIdleAnimation();
            timer = 0f;
            player.Input.OnAnyInput += InterruptIdle;
        }

        public override void OnUpdate(float delta)
        {
            if (player.Input.MovementDirection != Vector2.zero)
                InterruptIdle();

            if ((timer += Time.deltaTime) >= timeBetweenIdles)
            {
                player.AnimationController.SetRandomIdleAnimation();
                timer = 0f;
            }
        }

        public override void OnExit()
        {
            player.Input.OnAnyInput -= InterruptIdle;
            player.AnimationController.SetIsIdling(false);
        }

        private void InterruptIdle() => player.StateMachine.TryChangeState(new DefaultPlayerState(player));
    }
}
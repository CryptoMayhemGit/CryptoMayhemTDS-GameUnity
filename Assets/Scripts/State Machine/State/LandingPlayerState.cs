using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.StateMachine.State
{
    public class LandingPlayerState : PlayerState
    {
        public LandingPlayerState(PlayerContainer container, float landingTime) : base(container) 
        {
            this.landingTime = landingTime;
        }

        private float landingTime;
        private float timer;
        private bool initialized;

        public override void OnEnter() => initialized = false;

        public override void OnUpdate(float delta)
        {
            if (player.AnimationController.IsAnimatorInitialized)
            {
                TryStartTimer();

                if ((timer += Time.deltaTime) >= landingTime)
                {
                    player.StateMachine.TryChangeState(new DefaultPlayerState(player));
                }
            }
        }

        private void TryStartTimer()
        {
            if (initialized)
                return;

            player.Model.SetActive(true);
            player.AnimationController.SetLandingAnimation();
            timer = 0f;
            initialized = true;
        }
    }
}
using System;
using Assets.Scripts.StateMachine.State;
using UnityEngine;

namespace Assets.Scripts.StateMachine
{
    public class PlayerStateMachine : CharacterComponent
    {
        [SerializeField] private Containers.PlayerContainer container = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField, Min(0.1f)] private float landingTime = 0.1f;

        private PlayerState currentState;

        public override void OnSpawn()
        {
            currentState = new LandingPlayerState(container, landingTime);
            currentState.OnEnter();
        }

        private void OnEnable()
        {
            gameManager.Value.OnUpdate += OnUpdate;
            gameManager.Value.OnFixedUpdate += OnFixedUpdate;
        }

        private void OnDisable()
        {
            gameManager.Value.OnUpdate -= OnUpdate;
            gameManager.Value.OnFixedUpdate -= OnFixedUpdate;
        }

        private void OnCollisionEnter(Collision collision) => currentState.OnCollision(collision);
        

        private void OnUpdate() => currentState.OnUpdate(Time.deltaTime);

        private void OnFixedUpdate() => currentState.OnFixedUpdate(Time.fixedDeltaTime);

        public bool TryChangeState(PlayerState state)
        {
            if (currentState == state || !currentState.CanExit() || !state.CanEnter())
                return false;

            ChangeState(state);
            return true;
        }

        public void ForceChangeState(PlayerState state)
        {
            if (currentState == state)
                return;

            ChangeState(state);
        }

        private void ChangeState(PlayerState state)
        {
            currentState.OnExit();
            currentState = state;
            currentState.OnEnter();
        }
    }
}
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.StateMachine.State
{
    public abstract class PlayerState
    {
        protected readonly PlayerContainer player;

        protected PlayerState(PlayerContainer container)
        {
            player = container;
        }

        public virtual bool CanEnter() => true;
        public virtual bool CanExit() => true;
        public virtual void OnEnter() { }
        public virtual void OnExit() { }
        public virtual void OnUpdate(float delta) { }
        public virtual void OnFixedUpdate(float fixedDelta) { }
        public virtual void OnCollision(Collision collision) { }
    }
}
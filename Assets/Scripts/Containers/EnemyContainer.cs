using Assets.Scripts.Manager;
using UnityEngine;

namespace Assets.Scripts.Containers
{
    public class EnemyContainer : CharacterContainer, IAIContainer
    {
        [field: SerializeField] public AI.AIStateMachineBehaviour AIStateMachine { private set; get; } = null;
        [field: SerializeField] public Pathfinding.RichAI RichAI { private set; get; } = null;
        [field: SerializeField] public Collider Collider { private set; get; } = null;
        [field: SerializeField] public Animator Animator { private set; get; } = null;
        [field: SerializeField] public Search.TargetSearcher TargetSearcher { private set; get; } = null;
        [field: SerializeField] public Animations.EnemyAnimationController AnimationController { private set; get; } = null;

        public override void Spawn()
        {
            base.Spawn();
            TargetSearcher.OnSpawn();
            AnimationController.OnSpawn();
        }

        public override void Despawn()
        {
            base.Despawn();
            TargetSearcher.OnDespawn();
            AnimationController.OnDespawn();
        }
    }
}
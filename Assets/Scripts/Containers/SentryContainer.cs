using UnityEngine;

namespace Assets.Scripts.Containers
{
    public class SentryContainer : CharacterContainer, IAIContainer
    {
        [field: SerializeField] public Search.TargetSearcher TargetSearcher { private set; get; } = null;
        [field: SerializeField] public AI.AIStateMachineBehaviour AIStateMachineBehaviour { private set; get; } = null;

        public override void Spawn()
        {
            base.Spawn();
            TargetSearcher.OnSpawn();
            AIStateMachineBehaviour.OnSpawn();
        }

        public override void Despawn()
        {
            base.Despawn();
            TargetSearcher.OnDespawn();
            AIStateMachineBehaviour.OnDespawn();
        }
    }
}
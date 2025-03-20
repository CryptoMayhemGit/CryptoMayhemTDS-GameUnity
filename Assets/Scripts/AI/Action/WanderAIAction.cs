using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    public class WanderAIAction : BasePathfindingAIAction
    {
        [SerializeField] protected float stopTimeInWanderPoint = 3f;
        [SerializeField] protected float maxDistanceToNextWanderPoint = 20f;

        private bool isStopTime = false;
        private float stopInWanderPointTimer = 0;

        public override void OnUpdate(CharacterContainer character, float elapsedTime) => Wander((EnemyContainer)character);
        public override void OnEnd(CharacterContainer character) { }

        protected virtual void Wander(EnemyContainer enemy)
        {
            stopInWanderPointTimer += Time.deltaTime;

            if (isStopTime && stopInWanderPointTimer >= stopTimeInWanderPoint)
            {
                SetNextWanderPoint(enemy);
                stopInWanderPointTimer = 0;
                isStopTime = false;
                return;
            }

            if ((!agent.hasPath || agent.reachedEndOfPath) && !isStopTime)
            {
                Stop(enemy);
                stopInWanderPointTimer = 0;
                isStopTime = true;
                return;
            }
        }

        private void SetNextWanderPoint(EnemyContainer enemy)
        {
            float x = Random.Range(-maxDistanceToNextWanderPoint, maxDistanceToNextWanderPoint);
            float z = Random.Range(-maxDistanceToNextWanderPoint, maxDistanceToNextWanderPoint);
            Vector3 nextWanderPoint = new Vector3(enemy.Transform.position.x + x, 0, enemy.Transform.position.z + z);

            SetDestination(nextWanderPoint);
        }
    }
}
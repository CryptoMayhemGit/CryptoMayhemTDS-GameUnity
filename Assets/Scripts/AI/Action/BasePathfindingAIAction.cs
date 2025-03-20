using UnityEngine;
using Assets.Scripts.Containers;
using Pathfinding;

namespace Assets.Scripts.AI.Action
{
    public abstract class BasePathfindingAIAction : AIAction
    {
        protected IAstarAI agent;

        public override void OnStart(CharacterContainer character)
        {
            agent = ((EnemyContainer)character).RichAI;
        }

        protected virtual void SetDestination(Vector3 destination)
        {
            agent.destination = destination;
            agent.SearchPath();
        }
     
        protected virtual void Stop(EnemyContainer enemy)
        {
            agent.destination = enemy.Transform.position;
            agent.SetPath(null);
        }
    }
}
using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Condition
{
    public class TimeCondition : AICondition
    {
        [SerializeField, Min(0.1f)] private float time = 5f;

        public override bool Check(CharacterContainer character)
        {
            return ((EnemyContainer)character).AIStateMachine.CurrentState.ElapsedTime >= time;
        }
    }
}
using UnityEngine;
using Assets.Scripts.Containers;
using Assets.Scripts.Stats;

namespace Assets.Scripts.AI.Action
{
    public class MonsterBornAction : AIAction
    {
        [SerializeField] private AIStateMachine stateMachine = null;
        [SerializeField] private StatModifier statModifier = new();

        public override void OnStart(CharacterContainer character)
        {
            statModifier.Apply(character.Stats);
            ((EnemyContainer)character).AIStateMachine.ChangeStateMachine(stateMachine);
        }

        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {

        }

        public override void OnEnd(CharacterContainer character)
        {

        }
    }
}
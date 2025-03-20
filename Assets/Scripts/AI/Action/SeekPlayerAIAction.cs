using Assets.Scripts.Containers;
using Assets.Scripts.Sound;

namespace Assets.Scripts.AI.Action
{
    public class SeekPlayerAIAction : BasePathfindingAIAction
    {
        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {
            EnemyContainer enemy = (EnemyContainer)character;
            if (enemy.TargetSearcher.ClosestTarget == null)
                return;

            SetDestination(enemy.TargetSearcher.ClosestTarget.Transform.position);
            if (character.Sounds is EnemySounds s)
                s.PlayAgro();
        }

        public override void OnEnd(CharacterContainer character) => Stop((EnemyContainer)character);
    }
}
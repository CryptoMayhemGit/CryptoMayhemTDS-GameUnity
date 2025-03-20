using Assets.Scripts.Containers;

namespace Assets.Scripts.Effects.Action
{
    public class FreezeEnemyEffectAction : EffectAction
    {
        public override void Begin(CharacterContainer container)
        {
            container.Rigidbody.isKinematic = true;

            if (container is EnemyContainer enemyContainer)
            {
                enemyContainer.RichAI.canMove = false;

                if (enemyContainer.AIStateMachine != null)
                    enemyContainer.AIStateMachine.SetActive(false);

                if (enemyContainer.AnimationController != null)
                    enemyContainer.AnimationController.FreezeAnimator();
            }
        }

        public override void End(CharacterContainer container)
        {
            container.Rigidbody.isKinematic = false;


            if (container is EnemyContainer enemyContainer)
            {
                enemyContainer.RichAI.canMove = true;

                if (enemyContainer.AIStateMachine != null)
                    enemyContainer.AIStateMachine.SetActive(true);

                if (enemyContainer.AnimationController != null)
                    enemyContainer.AnimationController.UnFreezeAnimator();
            }
        }
    }
}
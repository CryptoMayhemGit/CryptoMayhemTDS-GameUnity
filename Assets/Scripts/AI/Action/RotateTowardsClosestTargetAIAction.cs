using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    public class RotateTowardsClosestTargetAIAction : AIAction
    {
        [SerializeField] private float rotationSpeed = 3f;

        public override void OnStart(CharacterContainer character) { }

        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {
            IAIContainer aiContainer = (IAIContainer)character;

            if (aiContainer.TargetSearcher.ClosestTarget == null)
                return;

            Transform targetTransform = aiContainer.TargetSearcher.ClosestTarget.Transform;
            float angle = Mathf.Atan2(targetTransform.position.z - character.Transform.position.z, targetTransform.position.x - character.Transform.position.x) * Mathf.Rad2Deg;
            character.Transform.rotation = Quaternion.RotateTowards(character.Transform.rotation, Quaternion.Euler(0f, -(angle - 90f), 0f), rotationSpeed);
        }

        public override void OnEnd(CharacterContainer character) { }
    }
}
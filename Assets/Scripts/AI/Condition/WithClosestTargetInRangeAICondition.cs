using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Condition
{
    public class WithClosestTargetInRangeAICondition : AICondition
    {
        [SerializeField] private bool lineOfSight = true;
        [SerializeField] private LayerMask ignoreLayerMask = default;
        [SerializeField, Range(0, 99f)] private float minDistance = 2f;
        [SerializeField, Range(0, 99f)] private float maxDistance = 20f;
        [SerializeField] private bool inRangeReturn = true;

        public override bool Check(CharacterContainer character)
        {
            IAIContainer aiContainer = (IAIContainer)character;

            if (aiContainer.TargetSearcher.ClosestTarget == null)
                return !inRangeReturn;

            float currentDistance = (aiContainer.TargetSearcher.ClosestTarget.Transform.position - character.Transform.position).sqrMagnitude;
            if (currentDistance >= minDistance * minDistance && currentDistance <= maxDistance * maxDistance)
            {
                if (lineOfSight && Physics.Linecast(character.Transform.position, aiContainer.TargetSearcher.ClosestTarget.Transform.position, ~ignoreLayerMask))
                    return !inRangeReturn;

                return inRangeReturn;
            }

            return !inRangeReturn;
        }
    }
}
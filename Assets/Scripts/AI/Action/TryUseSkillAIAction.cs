using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    public class TryUseSkillAIAction : AIAction
    {
        [SerializeField] private Skills.ActiveSkill skillToUse;

        public override void OnStart(CharacterContainer character) { }

        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {
            IAIContainer aiContainer = (IAIContainer)character;

            if (!character.Skills.CanUse(skillToUse) || aiContainer.TargetSearcher.ClosestTarget == null)
                return;

            character.Skills.Use(skillToUse, aiContainer.TargetSearcher.ClosestTarget.Transform.position);
        }

        public override void OnEnd(CharacterContainer character) { }
    }
}
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class MeleeAttackAnimationSkillAction : SkillAction
    {
        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            ((EnemyContainer)origin).AnimationController.SetMeleeAttackAnimation();
        }
    }
}
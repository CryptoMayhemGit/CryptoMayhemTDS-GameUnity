using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class EnemyBurrowSkillAction : SkillAction
    {
        [SerializeField] private float unburrowDistance = 3f;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            if (ShouldBurrow(origin, ((IAIContainer)origin).TargetSearcher.ClosestTarget))
            {
                ((EnemyContainer)origin).Animator.SetBool("burrow", true);
                ((EnemyContainer)origin).Collider.enabled = false;
            }
            else
            {
                ((EnemyContainer)origin).Animator.SetBool("burrow", false);
                ((EnemyContainer)origin).Collider.enabled = true;
            }
        }

        private bool ShouldBurrow(CharacterContainer origin, CharacterContainer target)
        {
            return target == null || ((target.Transform.position - origin.Transform.position).sqrMagnitude > unburrowDistance * unburrowDistance);
        }
    }
}
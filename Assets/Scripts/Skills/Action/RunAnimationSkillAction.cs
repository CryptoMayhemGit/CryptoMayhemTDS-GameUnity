using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class RunAnimationSkillAction : SkillAction
    {
        [SerializeField] private bool runState = false;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            ((EnemyContainer)origin).AnimationController.SetRunAnimation(runState);
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using UnityEngine.Profiling;

namespace Assets.Scripts.Animations
{
    public class EnemyAnimationController : CharacterComponent
    {
        [SerializeField] private GameManagerVariable gameManagerVariable = null;
        [SerializeField] private EnemyContainer enemyContainer = null;
        [SerializeField] private Animator animator = null;

        private int runHash;
        private int walkHash;
        private int meleeAttackHash;
        private int rangeAttackHash;
        private int detachmentHash;
        private bool isInitialized;

        public override void OnSpawn()
        {
            base.OnSpawn();
            gameManagerVariable.Value.OnUpdate += SetMovementAnimation;

            if (isInitialized)
                return;

            runHash = Animator.StringToHash("Run");
            walkHash = Animator.StringToHash("Walk");
            meleeAttackHash = Animator.StringToHash("MeleeAttack");
            rangeAttackHash = Animator.StringToHash("RangeAttack");
            detachmentHash = Animator.StringToHash("Detachment");

            if (animator == null)
                animator = GetComponentInChildren<Animator>();
            
            isInitialized = true;
        }

        public override void OnDespawn()
        {
            base.OnDespawn();
            gameManagerVariable.Value.OnUpdate -= SetMovementAnimation;
        }

        public void SetRunAnimation(bool state) => animator.SetBool(runHash, state);

        public void SetMovementAnimation()
        {
            Profiler.BeginSample("EnemyAnimationController.SetMovementAnimation");
            animator.SetBool(walkHash, enemyContainer.RichAI.velocity.sqrMagnitude > 1f);
            Profiler.EndSample();
        }
        public void SetMeleeAttackAnimation() => animator.SetTrigger(meleeAttackHash);
        public void SetRangeAttackAnimation() => animator.SetTrigger(rangeAttackHash);
        public void SetDetachmentAnimation() => animator.SetTrigger(detachmentHash);

        public void FreezeAnimator() => animator.speed = 0;
        public void UnFreezeAnimator() => animator.speed = 1;
    }
}
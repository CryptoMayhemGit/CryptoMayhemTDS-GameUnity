using Assets.Scripts.Containers;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Animations
{
    public class PlayerAnimationController : CharacterComponent
    {
        [SerializeField] private PlayerContainer player = null;
        [SerializeField] private Animator mechAnimator = null;
        [SerializeField] private Transform mainWeaponSocket = null;
        [SerializeField] private Transform secondaryWeaponSocket = null;
        private Animator mainWeaponAnimator = null;
        private Animator secondaryWeaponAnimator = null;

        public bool IsAnimatorInitialized => mechAnimator.isInitialized;

        private int moveXHash;
        private int moveYHash;
        private int dashHash;
        private int idle1Hash;
        private int idle2Hash;
        private int landingHash;
        private int deathHash;
        private int isIdlingHash;
        private int isDashingHash;
        private int shootHash;
        private int fallHash;

        private bool isInitalized;

        public override void OnSpawn()
        {
            base.OnSpawn();
            if (isInitalized)
                return;

            mainWeaponAnimator = mainWeaponSocket.GetComponentInChildren<Animator>();
            secondaryWeaponAnimator = secondaryWeaponSocket.GetComponentInChildren<Animator>();
            moveXHash = Animator.StringToHash("MoveX");
            moveYHash = Animator.StringToHash("MoveY");
            dashHash = Animator.StringToHash("dash");
            idle1Hash = Animator.StringToHash("idle1");
            idle2Hash = Animator.StringToHash("idle2");
            landingHash = Animator.StringToHash("landing");
            deathHash = Animator.StringToHash("death");
            isIdlingHash = Animator.StringToHash("isIdling");
            isDashingHash = Animator.StringToHash("isDashing");
            shootHash = Animator.StringToHash("shoot");
            fallHash = Animator.StringToHash("fall");

            isInitalized = true;
        }

        public override void OnDespawn()
        {
            base.OnDespawn();
            SetMovementAnimation(Vector3.zero);
        }

        public void SetMovementAnimation(Vector3 direction)
        {
            mechAnimator.SetFloat(moveXHash, direction.x);
            mechAnimator.SetFloat(moveYHash, direction.z);
        }

        public void StartDashAnimation(Vector2 direction)
        {
            mechAnimator.SetFloat(moveXHash, direction.x);
            mechAnimator.SetFloat(moveYHash, direction.y);
            mechAnimator.SetTrigger(dashHash);
            mechAnimator.SetBool(isDashingHash, true);
        }

        public void EndDashAnimation() => mechAnimator.SetBool(isDashingHash, false);

        public void SetLandingAnimation() => mechAnimator.SetTrigger(landingHash);
        [Button]
        public void SetFallAnimation() => mechAnimator.SetTrigger(fallHash);
        [Button]
        public void SetDeathAnimation(Animator animator) => animator.SetTrigger(deathHash);

        public void SetRandomIdleAnimation()
        {
            if (Random.value >= 0.5f)
                mechAnimator.SetTrigger(idle1Hash);
            else
                mechAnimator.SetTrigger(idle2Hash);
        }

        public void SetIsIdling(bool isIdling) => mechAnimator.SetBool(isIdlingHash, isIdling);

        public void SetMainWeaponAnimation() => mainWeaponAnimator?.SetTrigger(shootHash);

        public void SetSecondaryWeaponAnimation() => secondaryWeaponAnimator?.SetTrigger(shootHash);
    }
}
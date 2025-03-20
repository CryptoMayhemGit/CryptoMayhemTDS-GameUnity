using UnityEngine;

namespace Assets.Scripts.StateMachine.State
{
    public class DefaultPlayerState : PlayerState
    {
        public DefaultPlayerState(Containers.PlayerContainer container) : base(container) { }

        private float timeToIdle = 10f;
        private float idleTimer;

        private bool isAttackingMain;
        private bool isAttackingSecondary;

        public override void OnEnter()
        {
            player.Input.OnStartBasicAttack += player.Attack.StartMainAttack;
            player.Input.OnEndBasicAttack += player.Attack.EndMainAttack;
            player.Input.OnStartSecondaryAttack += player.Attack.StartSecondaryAttack;
            player.Input.OnEndSecondaryAttack += player.Attack.EndSecondaryAttack;
            player.Input.OnReloadMainWeapon += player.Attack.ReloadMainWeapon;
            player.Input.OnReloadSecondaryWeapon += player.Attack.ReloadSecondWeapon;
            player.Input.OnUseItem += UseItem;
            player.Input.OnUseTechnology += UseTechnology;
            player.Input.OnInteraction += player.Interactions.Interact;
            player.Input.OnAnyInput += ResetIdleTimer;
            idleTimer = 0f;

            player.Input.OnStartBasicAttack += SetMainAttackTrue;
            player.Input.OnEndBasicAttack += SetMainAttackFalse;
            player.Input.OnStartSecondaryAttack += SetSecondaryAttackTrue;
            player.Input.OnEndSecondaryAttack += SetSecondaryAttackFalse;
        }

        public override void OnExit()
        {
            player.Input.OnStartBasicAttack -= player.Attack.StartMainAttack;
            player.Input.OnEndBasicAttack -= player.Attack.EndMainAttack;
            player.Input.OnStartSecondaryAttack -= player.Attack.StartSecondaryAttack;
            player.Input.OnEndSecondaryAttack -= player.Attack.EndSecondaryAttack;
            player.Input.OnReloadMainWeapon -= player.Attack.ReloadMainWeapon;
            player.Input.OnReloadSecondaryWeapon -= player.Attack.ReloadSecondWeapon;
            player.Input.OnUseItem -= UseItem;
            player.Input.OnUseTechnology -= UseTechnology;
            player.Input.OnInteraction -= player.Interactions.Interact;
            player.Input.OnAnyInput -= ResetIdleTimer;

            player.Input.OnStartBasicAttack -= SetMainAttackTrue;
            player.Input.OnEndBasicAttack -= SetMainAttackFalse;
            player.Input.OnStartSecondaryAttack -= SetSecondaryAttackTrue;
            player.Input.OnEndSecondaryAttack -= SetSecondaryAttackFalse;

            if (isAttackingMain)
            {
                player.Attack.EndMainAttack();
                isAttackingMain = false;
            }

            if (isAttackingSecondary)
            {
                player.Attack.EndSecondaryAttack();
                isAttackingSecondary = false;
            }
        }

        public override void OnUpdate(float delta)
        {
            player.CannonRotate.RotateX(player.Input.CannonTarget, delta);

            if (player.Input.MovementDirection != Vector2.zero)
                ResetIdleTimer();

            if ((idleTimer += Time.deltaTime) >= timeToIdle)
            {
                idleTimer = 0f;
                player.StateMachine.TryChangeState(new IdlePlayerState(player, timeToIdle));
            }
        }

        public override void OnFixedUpdate(float fixedDelta)
        {
            player.Movement.Move(fixedDelta);
        }

        private void UseItem(int index)
        {
            if (player.Inventory.Items[index] != null)
                if (player.Items.CanUse(index))
                    player.Items.Use(index);
        }

        private void UseTechnology(int index)
        {
            if (player.Inventory.Technologys[index] != null)
                if (player.Inventory.Technologys[index] is Skills.ActiveSkill skill && player.Skills.CanUse(skill))
                    player.Skills.Use(skill, player.Input.CannonTarget);
        }

        private void ResetIdleTimer() => idleTimer = 0f;

        private void SetMainAttackTrue() => isAttackingMain = true;
        private void SetMainAttackFalse() => isAttackingMain = false;
        private void SetSecondaryAttackTrue() => isAttackingSecondary = true;
        private void SetSecondaryAttackFalse() => isAttackingSecondary = false;
    }
}
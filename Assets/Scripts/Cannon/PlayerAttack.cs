using Assets.Scripts.Weapons;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Cannon
{
    public class PlayerAttack : CharacterComponent
    {
        [field: SerializeField] public Transform LeftWeaponPivot { get; private set; } = null;
        [field: SerializeField] public Transform RightWeaponPivot { get; private set; } = null;

        [SerializeField] private Containers.PlayerContainer player = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        public Weapon MainWeapon { get; private set; }
        public Weapon SecondWeapon { get; private set; }

        public override void OnSpawn()
        {
            base.OnSpawn();

            if (player.Inventory.MainWeapon != null)
            {
                MainWeapon = Instantiate(player.Inventory.MainWeapon);
                MainWeapon.Init(player, LeftWeaponPivot, true);
            }

            if (player.Inventory.SecondWeapon != null)
            {
                SecondWeapon = Instantiate(player.Inventory.SecondWeapon);
                SecondWeapon.Init(player, RightWeaponPivot, false);
            }
        }
        public override void OnDespawn()
        {
            base.OnDespawn();
            EndMainAttack();
            EndSecondaryAttack();
        }

        public void ReloadMainWeapon() => MainWeapon.Reload();
        public void ReloadSecondWeapon() => SecondWeapon.Reload();

        public void StartMainAttack()
        {
            if (MainWeapon == null) 
                return;
            
            if (!player.CanAttack())
                return;

            player.AnimationController.SetMainWeaponAnimation();
            MainWeapon.StartAttack();
            gameManager.Value.OnUpdate += UpdateMainWeapon;
        }

        public void EndMainAttack()
        {
            if (MainWeapon == null) 
                return;
            
            if (!player.CanAttack())
                return;

            gameManager.Value.OnUpdate -= UpdateMainWeapon;
            MainWeapon.StopAttack();
        }

        public void StartSecondaryAttack()
        {
            if (SecondWeapon == null) 
                return;
            
            if (!player.CanAttack())
                return;

            player.AnimationController.SetSecondaryWeaponAnimation();
            SecondWeapon.StartAttack();
            gameManager.Value.OnUpdate += UpdateSecondaryWeapon;
        }

        public void EndSecondaryAttack()
        {
            if (SecondWeapon == null) 
                return;
            
            if (!player.CanAttack())
                return;

            gameManager.Value.OnUpdate -= UpdateSecondaryWeapon;
            SecondWeapon.StopAttack();
        }

        private void UpdateMainWeapon()
        {
            Profiler.BeginSample("PlayerAttack.UpdateMainWeapon");
            if (player.CanAttack() && MainWeapon.GetWeaponAmmo().CanShoot() && MainWeapon.IsCooldownReady())
                player.AnimationController.SetMainWeaponAnimation();

            if (!player.CanAttack() || !MainWeapon.UpdateAttack())
            {
                gameManager.Value.OnUpdate -= UpdateMainWeapon;
                MainWeapon.StopAttack();
            }
            Profiler.EndSample();
        }

        private void UpdateSecondaryWeapon()
        {
            Profiler.BeginSample("PlayerAttack.UpdateSecondaryWeapon");
            if (player.CanAttack() && SecondWeapon.GetWeaponAmmo().CanShoot() && SecondWeapon.IsCooldownReady())
                player.AnimationController.SetSecondaryWeaponAnimation();

            if (!player.CanAttack() || !SecondWeapon.UpdateAttack())
            {
                gameManager.Value.OnUpdate -= UpdateSecondaryWeapon;
                SecondWeapon.StopAttack();
            }
            Profiler.EndSample();
        }
    }
}
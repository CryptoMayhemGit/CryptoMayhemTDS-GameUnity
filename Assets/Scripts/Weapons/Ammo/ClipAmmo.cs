using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Weapons.Ammo
{
    public class ClipAmmo : WeaponAmmo
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField, Min(1)] private int maxAmmo = 1;
        [SerializeField, Min(0)] private float reloadTime = 0.5f;

        public event System.Action<int, int> OnAmmoStatusChanged;

        private int currentAmmo;
        private bool reloading;
        private float reloadCooldown;
        private int ammoToReload;

        public override void Init(Containers.PlayerContainer player)
        {
            base.Init(player);

            currentAmmo = maxAmmo;
        }

        public override bool CanShoot() => !reloading && currentAmmo > 0;

        public override void SubtractAmmo()
        {
            if ((currentAmmo -= 1) == 0)
                Reload();

            OnAmmoStatusChanged?.Invoke(currentAmmo, maxAmmo);
        }

        public override void Reload()
        {
            if (!reloading && currentAmmo < maxAmmo && biomass.DynamicValue >= biomassPerShot)
                StartReload();
        }

        private void StartReload()
        {
            if(reloadSound.IsNull == false)
            {
                FMODUnity.RuntimeManager.PlayOneShot(reloadSound, playerContainer.AttackPivot.position);
            }
            
            reloadCooldown = Time.time + reloadTime;
            reloading = true;

            int missingAmmo = maxAmmo - currentAmmo;

            ammoToReload = biomass.DynamicValue >= missingAmmo * biomassPerShot ?
                missingAmmo :
                Mathf.FloorToInt(biomass.DynamicValue / biomassPerShot);

            biomass.ModifyDynamicValue(ammoToReload * -biomassPerShot);

            gameManager.Value.OnUpdate += UpdateReload;
        }

        private void UpdateReload()
        {
            Profiler.BeginSample("ClipAmmo.UpdateReload");
            if (reloadCooldown <= Time.time)
            {
                gameManager.Value.OnUpdate -= UpdateReload;
                reloading = false;
                currentAmmo += ammoToReload;
                OnAmmoStatusChanged?.Invoke(currentAmmo, maxAmmo);
            }
            Profiler.EndSample();
        }
    }
}
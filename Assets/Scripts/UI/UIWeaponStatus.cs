using Assets.Scripts.Containers;
using Assets.Scripts.Inventory;
using Assets.Scripts.Weapons;
using Assets.Scripts.Weapons.Ammo;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

namespace Assets.Scripts.UI
{
    public class UIWeaponStatus : UIPlayer
    {
        [SerializeField] private bool isMainWeapon = false;
        [SerializeField] private TextMeshProUGUI weaponName = null;
        [SerializeField] private Image weaponIcon = null;
        [SerializeField] private Image ammoBackground = null;
        [SerializeField] private Image ammoFillBar = null;

        protected override void Enable(PlayerContainer playerContainer)
        {
            if (isMainWeapon && playerContainer.Attack.MainWeapon != null)
                SetUIForSelectedWeapon(playerContainer.Attack.MainWeapon);
            else if (playerContainer.Attack.SecondWeapon != null)
                SetUIForSelectedWeapon(playerContainer.Attack.SecondWeapon);
        }

        protected override void Disable(PlayerContainer playerContainer)
        {
            if (playerContainer.Attack.MainWeapon.GetWeaponAmmo() is ClipAmmo mainClipAmmo)
                mainClipAmmo.OnAmmoStatusChanged -= ChangeCurrentAmmoFillBar;

            if (playerContainer.Attack.SecondWeapon.GetWeaponAmmo() is ClipAmmo secondClipAmmo)
                secondClipAmmo.OnAmmoStatusChanged -= ChangeCurrentAmmoFillBar;
        }

        private void SetUIForSelectedWeapon(Weapon weapon)
        {
            if (weapon.Sprite != null)
                weaponIcon.sprite = weapon.Sprite;

            weaponName.text = weapon.localizedStringShort.GetLocalizedString();

            switch (weapon.GetWeaponAmmo())
            {
                case BiomassAmmo biomassAmmo:
                    ammoBackground.gameObject.SetActive(false);
                    break;
                case ClipAmmo clipAmmo:
                    ammoBackground.gameObject.SetActive(true);
                    clipAmmo.OnAmmoStatusChanged += ChangeCurrentAmmoFillBar;
                    ammoFillBar.fillAmount = 1f;
                    break;
            }
        }

        private void ChangeCurrentAmmoFillBar(int current, int max)
        {
            ammoFillBar.fillAmount = (float)current / max;
        }
    }
}
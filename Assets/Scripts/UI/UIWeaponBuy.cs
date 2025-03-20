using Assets.Scripts.Inventory;
using Assets.Scripts.UI.Tooltip;
using Sirenix.OdinInspector;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIWeaponBuy : UIBuy, ITooltipable
    {
        [SerializeField] private Weapons.Weapon weapon = null;
        [SerializeField] private SOArchitecture.WeaponList weaponsOwned = null;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI itemCostTitle;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI requiredZealyLevelTitle;

        public Item Item => weapon;

        private void Awake()
        {
            if (GetWeaponReachedCount() > 1)
                transform.parent.gameObject.SetActive(false);
        }

        protected override void TryBuy()
        {
            if (uiInventory == null)
                return;

            if (uiInventory.TryBuyWeapon(weapon, weapon.MassCost, weapon.RequiredZealyLevel))
            {
                if (GetWeaponReachedCount() < 2)
                {
                    return;
                }

                transform.parent.gameObject.SetActive(false);
            }
        }

        protected int GetWeaponReachedCount()
        {
            int weaponsOwnedCount = weaponsOwned.ItemCount(weapon);
            int mainWeapon = uiInventory.Inventory.MainWeapon == weapon ? 1 : 0;
            int secondWeapon = uiInventory.Inventory.SecondWeapon == weapon ? 1 : 0;

            return weaponsOwnedCount + mainWeapon + secondWeapon;
        }

        protected override void CanBuyInternal()
        {
            possibleBuyBackground.gameObject.SetActive(true);
            imPossibleBuyBackground.gameObject.SetActive(false);
            
            if (uiInventory.CheckBalance(weapon.MassCost, weapon.RequiredZealyLevel))
            {
                button.interactable = true;
                buyText.gameObject.SetActive(true);
                buyLocker.gameObject.SetActive(false);
            }
            else
            {
                UpdateWeaponCostColor();
                button.interactable = false;
                buyText.gameObject.SetActive(false);
                buyLocker.gameObject.SetActive(true);
            }

            uiButtonHandler.ForceUpdateState();
        }

        protected override void InitInternal()
        {
            itemName.text = weapon.localizedStringShort.GetLocalizedString();
            itemCost.text = weapon.MassCost.ToString();
            itemImage.sprite = weapon.Sprite;

            if (requiredZealyLevel == null || requiredZealyLevelTitle == null)
            {
                return;
            }

            if (weapon.RequiredZealyLevel == 0)
            {
                requiredZealyLevel.text = string.Empty;
                requiredZealyLevelTitle.gameObject.SetActive(false);
            }
            else
            {
                requiredZealyLevel.text = weapon.RequiredZealyLevel.ToString();
            }
        }

        private void UpdateWeaponCostColor()
        {
            if (uiInventory.CheckMassCostBalance(weapon.MassCost))
            {
                itemCost.color = Color.white;
                itemCostTitle.color = Color.white;
            }
            else
            {
                itemCost.color = Color.red;
                itemCostTitle.color = Color.red;
            }

            if (requiredZealyLevel == null || requiredZealyLevelTitle == null)
            {
                return;
            }

            if (uiInventory.CheckRequiredZealyLevelBalance(weapon.RequiredZealyLevel))
            {
                requiredZealyLevel.color = Color.white;
                requiredZealyLevelTitle.color = Color.white;
            }
            else
            {
                requiredZealyLevel.color = Color.red;
                requiredZealyLevelTitle.color = Color.red;
            }
        }
    }
}
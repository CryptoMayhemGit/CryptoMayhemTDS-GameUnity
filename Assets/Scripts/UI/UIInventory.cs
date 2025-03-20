using Assets.Scripts.Inventory;
using Assets.Scripts.Skills;
using Assets.Scripts.UI.DragAndDrop;
using Assets.Scripts.Weapons;
using QFSW.QC;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIInventory : MonoBehaviour
    {
        private delegate void UpdateInventoryDelegate();
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";


        [SerializeField] private PlayerInventory inventory = null;
        [SerializeField] private FloatVariable biomass = null;
        
        [SerializeField] private UIWeaponDragSource weaponSlot = null;
        [SerializeField] private Transform weaponsContainer = null;
        
        [SerializeField] private UISkillDragSource skillSlot = null;
        [SerializeField] private Transform skillsContainer = null;
       
        [SerializeField] private UIConsumableItemDragSource consumableItemSlot = null;
        [SerializeField] private Transform consumableItemContainer = null;

        [Space] [SerializeField] private Button startGameButton;

        private UIButtonHandler _startGameUIButtonHandler;
        private UpdateInventoryDelegate OnInventoryDelegateUpdate;

        private UIBuy[] allBuySlots;

        public PlayerInventory Inventory => inventory;

        public void Init()
        {
            inventory.LoadAll();

            for (var i = 0; i < inventory.WeaponsOwned.Count; i++)
                Instantiate(weaponSlot, weaponsContainer).Init(inventory.WeaponsOwned[i]);

            for (var i = 0; i < inventory.SkillsOwned.Count; i++)
                Instantiate(skillSlot, skillsContainer).Init(inventory.SkillsOwned[i]);

            for (var i = 0; i < inventory.ItemsOwned.Count; i++)
                Instantiate(consumableItemSlot, consumableItemContainer).Init(inventory.ItemsOwned[i]);

            #region BuySlotInit

            allBuySlots = GetComponentsInChildren<UIBuy>(true);
            foreach (var slot in allBuySlots)
                slot.Init(this);

            #endregion

            OnInventoryDelegateUpdate += UpdateBuyItemState;
            OnInventoryDelegateUpdate += TryUnlockStartButton;

            Assert.IsNotNull(startGameButton, "startGameButton != null");
            _startGameUIButtonHandler = startGameButton.GetComponent<UIButtonHandler>();
            Assert.IsNotNull(_startGameUIButtonHandler, "_uiButtonHandler != null");

            OnInventoryDelegateUpdate?.Invoke();
        }

        private void OnDestroy()
        {
            OnInventoryDelegateUpdate -= UpdateBuyItemState;
            OnInventoryDelegateUpdate -= TryUnlockStartButton;
        }


        public bool TryBuyWeapon(Weapon weapon, float massCost, int requiredZealyLevel)
        {
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);

            if (massCost <= biomass.Value && requiredZealyLevel <= zealyLevel)
            {
                inventory.WeaponsOwned.Add(weapon);
                biomass.Value -= massCost;
                Instantiate(weaponSlot, weaponsContainer).Init(weapon);
                inventory.SaveWeapons();
                OnInventoryDelegateUpdate?.Invoke();
                return true;
            }

            return false;
        }

        public bool TryBuyConsumableItem(ConsumableItem consumableItem, float cost)
        {
            if (cost <= biomass.Value)
            {
                inventory.ItemsOwned.Add(consumableItem);
                biomass.Value -= cost;
                Instantiate(consumableItemSlot, consumableItemContainer).Init(consumableItem);
                inventory.SaveItems();
                OnInventoryDelegateUpdate?.Invoke();
                return true;
            }

            return false;
        }

        public bool TryBuyTechnology(Skill skill, float cost)
        {
            if (cost <= biomass.Value && !inventory.SkillsOwned.Contains(skill))
            {
                inventory.SkillsOwned.Add(skill);
                biomass.Value -= cost;
                Instantiate(skillSlot, skillsContainer).Init(skill);
                inventory.SaveSkills();
                OnInventoryDelegateUpdate?.Invoke();
                return true;
            }

            return false;
        }

        public void UpdateInventory() => OnInventoryDelegateUpdate?.Invoke();
        public bool CheckBalance(float massCost, int requiredZealyLevel)
        {
            if (CheckMassCostBalance(massCost) == false)
            {
                return false;
            }
            else if(CheckRequiredZealyLevelBalance(requiredZealyLevel) == false)
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        public bool CheckMassCostBalance(float massCost)
        {
            if (massCost <= biomass.Value)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public bool CheckRequiredZealyLevelBalance(int requiredZealyLevel)
        {
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);

            if (requiredZealyLevel <= zealyLevel)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        private void UpdateBuyItemState()
        {
            foreach (var slot in allBuySlots)
                slot.CanBuy();
        }

        private void TryUnlockStartButton()
        {
            startGameButton.interactable = CheckWeaponsSet();
            _startGameUIButtonHandler.ForceUpdateState();
        }

        private bool CheckWeaponsSet() => inventory.MainWeapon != null && inventory.SecondWeapon != null;

        [Command("AddBioMass")]
        public void AddBioMass(float value)
        {
            biomass.Value += value;
            OnInventoryDelegateUpdate?.Invoke();
        }
    }
}
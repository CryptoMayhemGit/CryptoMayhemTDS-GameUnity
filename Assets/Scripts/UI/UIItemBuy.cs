using Assets.Scripts.UI.Tooltip;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Assets.Scripts.Inventory;

namespace Assets.Scripts.UI
{
    public class UIItemBuy : UIBuy, ITooltipable
    {
        [SerializeField] private Inventory.ConsumableItem item = null;
        [SerializeField] private TextMeshProUGUI countItemsText;

        [SerializeField] private Image disableBuyBackground;

        public Item Item => item;

        protected override void TryBuy()
        {
            if (uiInventory == null)
                return;
            uiInventory.TryBuyConsumableItem(item, item.MassCost);
        }

        protected override void CanBuyInternal()
        {
            int itemCount = GetItemCount();
            countItemsText.text = $"({itemCount}/2)";

            if (itemCount >= 2)
            {
                button.interactable = false;
                disableBuyBackground.gameObject.SetActive(true);
                buyText.gameObject.SetActive(false);

                possibleBuyBackground.gameObject.SetActive(false);
                imPossibleBuyBackground.gameObject.SetActive(false);
                buyLocker.gameObject.SetActive(true);
            }
            else if (uiInventory.CheckBalance(item.MassCost, item.RequiredZealyLevel))
            {
                button.interactable = true;
                possibleBuyBackground.gameObject.SetActive(true);
                buyText.gameObject.SetActive(true);

                disableBuyBackground.gameObject.SetActive(false);
                imPossibleBuyBackground.gameObject.SetActive(false);
                buyLocker.gameObject.SetActive(false);
            }
            else
            {
                button.interactable = false;
                possibleBuyBackground.gameObject.SetActive(false);
                buyText.gameObject.SetActive(false);

                disableBuyBackground.gameObject.SetActive(false);
                imPossibleBuyBackground.gameObject.SetActive(true);
                buyLocker.gameObject.SetActive(true);
            }
            uiButtonHandler.ForceUpdateState();
        }

        private int GetItemCount()
        {
            int itemTypeCount = uiInventory.Inventory.ItemCount(item);
            int ownedItemsCount = uiInventory.Inventory.ItemsOwned.ItemCount(item);

            int itemCount = itemTypeCount + ownedItemsCount;
            return itemCount;
        }

        protected override void InitInternal()
        {
            itemName.text = item.localizedStringShort.GetLocalizedString();
            itemCost.text = $"{item.MassCost} {COSTBASENAME}";

            if (requiredZealyLevel == null)
            {
                return;
            }

            if (item.RequiredZealyLevel == 0)
            {
                requiredZealyLevel.text = string.Empty;
            }
            else
            {
                requiredZealyLevel.text = item.RequiredZealyLevel.ToString();
            }

            itemImage.sprite = item.Sprite;
        }
    }
}
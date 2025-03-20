using UnityEngine;
using UnityEngine.EventSystems;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UIConsumableItemDropTarget : UIDropTarget, IPointerClickHandler
    {
        [SerializeField] private Inventory.PlayerInventory inventory = null;
        [SerializeField] private SOArchitecture.ConsumableItemList itemsOwned = null;
        [SerializeField] private UIConsumableItemDragSource consumableItemSlot = null;
        [SerializeField] private Transform consumableItemContainer = null;
        [SerializeField, Range(0, 2)] private int index = 0;

        public override void TryDrop(UIDragSource source)
        {
            if (source is UIConsumableItemDragSource uIConsumableItemSource)
            {
                if (inventory.Items[index] != null)
                {
                    itemsOwned.Add(inventory.Items[index]);
                    Instantiate(consumableItemSlot, consumableItemContainer).Init(inventory.Items[index]);
                }

                inventory.Items[index] = uIConsumableItemSource.ConsumableItem;
                Refresh();
                itemsOwned.Remove(uIConsumableItemSource.ConsumableItem);
                Destroy(uIConsumableItemSource.gameObject);
                onChanged.Invoke();
            }
        }

        public void Refresh()
        {
            if (inventory.Items[index] != null)
                image.sprite = inventory.Items[index].Sprite;
            else
                image.sprite = defaultSprite;
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (inventory.Items[index] != null)
            {
                itemsOwned.Add(inventory.Items[index]);
                Instantiate(consumableItemSlot, consumableItemContainer).Init(inventory.Items[index]);
                inventory.Items[index] = null;
                image.sprite = defaultSprite;
                onChanged.Invoke();
            }
        }
    }
}
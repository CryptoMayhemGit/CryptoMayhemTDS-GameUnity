using Assets.Scripts.Inventory;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UIConsumableItemDragSource : UIDragSource, Tooltip.ITooltipable
    {
        private ConsumableItem consumableItem;

        public ConsumableItem ConsumableItem => consumableItem;
        public override UnityEngine.Sprite Sprite => consumableItem.Sprite;
        public Item Item => consumableItem;

        public void Init(ConsumableItem consumableItem)
        {
            this.consumableItem = consumableItem;
            image.sprite = consumableItem.Sprite;
        }
    }
}
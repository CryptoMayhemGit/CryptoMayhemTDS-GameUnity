using Assets.Scripts.Inventory;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI.Cooldowns
{
    public class UIConsumableItem : MonoBehaviour
    {
        [SerializeField] private Image itemIcon = null;
        [SerializeField] private Image itemCooldownFillBar = null;

        public ConsumableItemInstance CurrentItem { get; private set; }

        public void Init(ConsumableItemInstance item)
        {
            CurrentItem = item;

            if (item != null)
            {
                if (item.Sprite != null)
                    itemIcon.sprite = item.Sprite;

                itemIcon.enabled = true;
                itemCooldownFillBar.enabled = true;
            }
            else
            {
                itemIcon.enabled = false;
                itemCooldownFillBar.enabled = false;
            }
        }

        public void Refresh(float currentTime, float endTime)
        {
            itemCooldownFillBar.fillAmount = 1f - currentTime / endTime;
        }
    }
}
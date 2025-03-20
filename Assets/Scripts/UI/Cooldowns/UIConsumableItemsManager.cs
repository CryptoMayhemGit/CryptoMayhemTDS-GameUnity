using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.Cooldowns;
using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.UI.Cooldowns
{
    public class UIConsumableItemsManager : UIPlayer
    {
        [SerializeField] private GameManagerVariable gameManagerVariable = null;
        [SerializeField] private List<UIConsumableItem> uiItems = new();

        private readonly Dictionary<UIConsumableItem, ICooldown> activeCooldowns = new();

        protected override void Enable(PlayerContainer playerContainer)
        {
            int itemsInited = 0;

            foreach (var item in playerContainer.Items.Items)
                uiItems[itemsInited++].Init(item);

            for (int i = itemsInited; i < uiItems.Count; i++)
                uiItems[i].Init(null);

            playerContainer.Cooldowns.OnCooldownAdd += OnCooldownAdd;
            playerContainer.Cooldowns.OnCooldownRemove += OnCooldownRemove;
        }

        protected override void Disable(PlayerContainer playerContainer)
        {
            playerContainer.Cooldowns.OnCooldownAdd -= OnCooldownAdd;
            playerContainer.Cooldowns.OnCooldownRemove -= OnCooldownRemove;
        }

        private void OnCooldownAdd(IUsable usable, ICooldown cooldown)
        {
            foreach (UIConsumableItem item in uiItems)
                if ((IUsable)item.CurrentItem == usable)
                    activeCooldowns.Add(item, cooldown);

            if (activeCooldowns.Count == 1)
                gameManagerVariable.Value.OnUpdate += UpdateUI;
        }

        private void OnCooldownRemove(IUsable usable)
        {
            foreach (UIConsumableItem item in uiItems)
                if ((IUsable)item.CurrentItem == usable)
                    activeCooldowns.Remove(item);

            if (activeCooldowns.Count == 0)
                gameManagerVariable.Value.OnUpdate -= UpdateUI;
        }

        private void UpdateUI()
        {
            foreach (var item in activeCooldowns)
                item.Key.Refresh(item.Value.CurrentTime, item.Value.EndTime);
        }
    }
}
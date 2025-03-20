using Assets.Scripts.Containers;
using Assets.Scripts.Cooldowns;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.UI.Cooldowns
{
    public class UISkillsManager : UIPlayer
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManagerVariable = null;
        [SerializeField] private List<UISkill> uiSkills = new();

        private readonly Dictionary<IUsable, UISkill> currentUIs = new();
        private readonly Dictionary<UISkill, ICooldown> activeCooldowns = new();

        protected override void Enable(PlayerContainer playerContainer)
        {
            for (int i = 0; i < uiSkills.Count; i++)
            {
                if (playerContainer.Inventory.Technologys[i] is Skills.ActiveSkill active)
                    currentUIs.Add(active, uiSkills[i]);

                uiSkills[i].Init(playerContainer.Inventory.Technologys[i]);
            }

            playerContainer.Cooldowns.OnCooldownAdd += OnCooldownAdd;
            playerContainer.Cooldowns.OnCooldownRemove += OnCooldownRemove;
        }

        protected override void Disable(PlayerContainer playerContainer)
        {
            playerContainer.Cooldowns.OnCooldownAdd -= OnCooldownAdd;
            playerContainer.Cooldowns.OnCooldownRemove -= OnCooldownRemove;

            currentUIs.Clear();
        }

        private void OnCooldownAdd(IUsable usable, ICooldown cooldown)
        {
            if (currentUIs.TryGetValue(usable, out var ui))
            {
                activeCooldowns.Add(ui, cooldown);

                if (activeCooldowns.Count == 1)
                    gameManagerVariable.Value.OnUpdate += UpdateUI;
            }
        }

        private void OnCooldownRemove(IUsable usable)
        {
            if (currentUIs.TryGetValue(usable, out var ui))
            {
                activeCooldowns.Remove(ui);

                if (activeCooldowns.Count == 0)
                    gameManagerVariable.Value.OnUpdate -= UpdateUI;
            }
        }

        private void UpdateUI()
        {
            foreach (var item in activeCooldowns)
                item.Key.Refresh(item.Value.CurrentTime, item.Value.EndTime);
        }
    }
}
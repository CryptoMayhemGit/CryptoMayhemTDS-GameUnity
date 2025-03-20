using Assets.Scripts.Skills;
using Assets.Scripts.UI.Tooltip;
using UnityEngine;
using Assets.Scripts.Inventory;

namespace Assets.Scripts.UI
{
    public class UISkillBuy : UIBuy, ITooltipable
    {
        [SerializeField] private Skills.Skill skill = null;
        [SerializeField] private SOArchitecture.SkillList skillsOwned = null;

        public Item Item => skill;

        private void Awake()
        {
            if (skillsOwned.Contains(skill))
                transform.parent.gameObject.SetActive(false);

            foreach (var playerSkill in uiInventory.Inventory.Technologys)
            {
                if (playerSkill != null && playerSkill.Equals(skill))
                    transform.parent.gameObject.SetActive(false);
            }
        }

        protected override void TryBuy()
        {
            if (uiInventory == null)
                return;
            if (uiInventory.TryBuyTechnology(skill, skill.MassCost))
                transform.parent.gameObject.SetActive(false);
        }

        protected override void CanBuyInternal()
        {
            if (uiInventory.CheckBalance(skill.MassCost, skill.RequiredZealyLevel))
            {
                button.interactable = true;
                possibleBuyBackground.gameObject.SetActive(true);
                buyText.gameObject.SetActive(true);

                imPossibleBuyBackground.gameObject.SetActive(false);
                buyLocker.gameObject.SetActive(false);
            }
            else
            {
                button.interactable = false;
                possibleBuyBackground.gameObject.SetActive(false);
                buyText.gameObject.SetActive(false);

                imPossibleBuyBackground.gameObject.SetActive(true);
                buyLocker.gameObject.SetActive(true);
            }

            uiButtonHandler.ForceUpdateState();
        }

        protected override void InitInternal()
        {
            itemName.text = skill.localizedStringShort.GetLocalizedString();
            itemCost.text = $"{skill.MassCost} {COSTBASENAME}";
            itemImage.sprite = skill.Sprite;

            if (requiredZealyLevel == null)
            {
                return;
            }

            if (skill.RequiredZealyLevel == 0)
            {
                requiredZealyLevel.text = string.Empty;
            }
            else
            {
                requiredZealyLevel.text = skill.RequiredZealyLevel.ToString();
            }
        }
    }
}
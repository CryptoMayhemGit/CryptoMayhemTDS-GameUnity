using UnityEngine;
using UnityEngine.EventSystems;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UISkillDropTarget : UIDropTarget, IPointerClickHandler
    {
        [SerializeField] private Inventory.PlayerInventory inventory = null;
        [SerializeField] private SOArchitecture.SkillList skillsOwned = null;
        [SerializeField] private UISkillDragSource skillSlot = null;
        [SerializeField] private Transform skillsContainer = null;
        [SerializeField, Range(0, 4)] private int index = 0;

        public override void TryDrop(UIDragSource source)
        {
            if (source is UISkillDragSource skillSource && System.Array.IndexOf(inventory.Technologys, skillSource.Skill) == -1)
            {
                if (inventory.Technologys[index] != null)
                {
                    skillsOwned.Add(inventory.Technologys[index]);
                    Instantiate(skillSlot, skillsContainer).Init(inventory.Technologys[index]);
                }

                inventory.Technologys[index] = skillSource.Skill;
                Refresh();
                skillsOwned.Remove(skillSource.Skill);
                Destroy(skillSource.gameObject);
                onChanged.Invoke();
            }
        }

        public void Refresh()
        {
            if (inventory.Technologys[index] != null)
                image.sprite = inventory.Technologys[index].Sprite;
            else
                image.sprite = defaultSprite;
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (inventory.Technologys[index] != null)
            {
                skillsOwned.Add(inventory.Technologys[index]);
                Instantiate(skillSlot, skillsContainer).Init(inventory.Technologys[index]);
                inventory.Technologys[index] = null;
                image.sprite = defaultSprite;
                onChanged.Invoke();
            }
        }
    }
}
using Assets.Scripts.Inventory;
using Assets.Scripts.Skills;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UISkillDragSource : UIDragSource, Tooltip.ITooltipable
    {
        private Skill skill;

        public Skill Skill => skill;
        public override UnityEngine.Sprite Sprite => skill.Sprite;
        public Item Item => skill;

        public void Init(Skill skill)
        {
            this.skill = skill;
            image.sprite = skill.Sprite;
        }
    }
}
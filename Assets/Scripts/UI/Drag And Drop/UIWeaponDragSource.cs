using Assets.Scripts.Inventory;
using Assets.Scripts.Weapons;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UIWeaponDragSource : UIDragSource, Tooltip.ITooltipable
    {
        private Weapon weapon;

        public Weapon Weapon => weapon;
        public override UnityEngine.Sprite Sprite => weapon.Sprite;
        public Item Item => weapon;

        public void Init(Weapon weapon)
        {
            this.weapon = weapon;
            image.sprite = weapon.Sprite;
        }
    }
}
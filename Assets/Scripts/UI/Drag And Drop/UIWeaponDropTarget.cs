using UnityEngine;
using UnityEngine.EventSystems;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UIWeaponDropTarget : UIDropTarget, IPointerClickHandler
    {
        private enum Type { Main, Secondary }

        [SerializeField] private Inventory.PlayerInventory inventory = null;
        [SerializeField] private Type type = Type.Main;
        [SerializeField] private SOArchitecture.WeaponList weaponsOwned = null;
        [SerializeField] private UIWeaponDragSource weaponSlot = null;
        [SerializeField] private Transform weaponsContainer = null;

        public override void TryDrop(UIDragSource source)
        {
            if (source is UIWeaponDragSource weaponSource)
            {
                if (type == Type.Main)
                {
                    if (inventory.MainWeapon != null)
                    {
                        weaponsOwned.Add(inventory.MainWeapon);
                        Instantiate(weaponSlot, weaponsContainer).Init(inventory.MainWeapon);
                    }

                    inventory.MainWeapon = weaponSource.Weapon;
                }
                else
                {
                    if (inventory.SecondWeapon != null)
                    {
                        weaponsOwned.Add(inventory.SecondWeapon);
                        Instantiate(weaponSlot, weaponsContainer).Init(inventory.SecondWeapon);
                    }

                    inventory.SecondWeapon = weaponSource.Weapon;
                }

                Refresh();
                weaponsOwned.Remove(weaponSource.Weapon);
                Destroy(weaponSource.gameObject);
                onChanged.Invoke();
            }
        }

        public void Refresh()
        {
            if (type == Type.Main && inventory.MainWeapon != null)
                image.sprite = inventory.MainWeapon.Sprite;
            else if (type == Type.Secondary && inventory.SecondWeapon != null)
                image.sprite = inventory.SecondWeapon.Sprite;
            else
                image.sprite = defaultSprite;
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (type == Type.Main && inventory.MainWeapon != null)
            {
                weaponsOwned.Add(inventory.MainWeapon);
                Instantiate(weaponSlot, weaponsContainer).Init(inventory.MainWeapon);
                inventory.MainWeapon = null;
                image.sprite = defaultSprite;
                onChanged.Invoke();
            }
            else if (type == Type.Secondary && inventory.SecondWeapon != null)
            {
                weaponsOwned.Add(inventory.SecondWeapon);
                Instantiate(weaponSlot, weaponsContainer).Init(inventory.SecondWeapon);
                inventory.SecondWeapon = null;
                image.sprite = defaultSprite;
                onChanged.Invoke();
            }
        }
    }
}
using UnityEngine;

namespace Assets.Scripts.Manager
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Manager/Cursor")]
    public class CursorManager : Manager
    {
        [SerializeField] private Inventory.PlayerInventory inventory = null;

        public override void Enable() => Cursor.SetCursor(inventory.WeaponCursor, new Vector2(128f, 128f), CursorMode.Auto);
        public override void Disable() => Cursor.SetCursor(null, Vector2.zero, CursorMode.Auto);
    }
}
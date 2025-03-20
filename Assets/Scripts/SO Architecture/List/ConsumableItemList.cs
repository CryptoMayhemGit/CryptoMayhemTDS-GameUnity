using Assets.Scripts.Inventory;

namespace Assets.Scripts.SOArchitecture
{
    [UnityEngine.CreateAssetMenu(menuName = SOArchitectureDirectories.LIST_COLLECTION + "ConsumableItem")]
    public class ConsumableItemList : ListCollection<Inventory.ConsumableItem>
    {
    }
}
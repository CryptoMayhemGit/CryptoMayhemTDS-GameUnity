using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Inventory
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Inventory/ItemTypeList")]
    public class ItemTypeList : ScriptableObject
    {
        [SerializeField] private List<ItemType> itemTypes = new();

        public IReadOnlyList<ItemType> ItemTypes => itemTypes;
    }
}
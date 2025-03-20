using Assets.Scripts.Inventory;
using Sirenix.OdinInspector;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Assets.Scripts.Save
{
    public class SaveManager : MonoBehaviour
    {
//        private readonly int INVALID_INDEX = -1;

//        [SerializeField] private List<InventoryPreset> presets = new();
//        [SerializeField] private List<Item> itemsConfig = new();
//        [SerializeField] private ItemTypeList typeList = null;

//        private void Awake() => LoadInventoryPresets();

//        public void SaveInventoryPresets()
//        {
//            foreach (var preset in presets)
//                foreach (var pair in preset.Items)
//                    PlayerPrefs.SetInt(preset.name + " " + pair.Key.name, itemsConfig.IndexOf(pair.Value));
//        }

//        private void LoadInventoryPresets()
//        {
//            foreach (var preset in presets)
//                foreach (var type in typeList.ItemTypes)
//                {
//                    int index = PlayerPrefs.GetInt(preset.name + " " + type.name, INVALID_INDEX);

//                    if (index != INVALID_INDEX)
//                        preset.Set(type, itemsConfig[index]);
//                }
//        }

//#if UNITY_EDITOR
//        [Button]
//        private void PopulateItemsConfig()
//        {
//            itemsConfig = AssetDatabase.FindAssets("t:" + typeof(Item).Name)
//                .Select(x => AssetDatabase.GUIDToAssetPath(x))
//                .Select(x => AssetDatabase.LoadAssetAtPath<Item>(x))
//                .ToList();
//        }
//#endif
    }
}
using System.Collections.Generic;
using System.Linq;
using Assets.Scripts.Skills;
using Assets.Scripts.SOArchitecture;
using Assets.Scripts.Weapons;
using UnityEngine;

namespace Assets.Scripts.Inventory
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Inventory/PlayerInventory")]
    public class PlayerInventory : ScriptableObject
    {
        [field: SerializeField] public Movement.Type.MovementType MovementType { private set; get; } = null;
        [field: SerializeField] public Texture2D WeaponCursor { private set; get; } = null;
        [field: SerializeField, Min(1)] public int MaxAmmo { private set; get; } = 1;
        [field: SerializeField] public bool DualShoot { private set; get; } = true;
        [field: SerializeField] public Weapon MainWeapon { set; get; } = null;
        [field: SerializeField] public Weapon SecondWeapon { set; get; } = null;
        [field: SerializeField] public ConsumableItem[] Items { private set; get; } = new ConsumableItem[3];
        [field: SerializeField] public Skill[] Technologys { private set; get; } = new Skill[5];

        [SerializeField] private List<Weapon> allWeapons = new();
        [SerializeField] private List<Skill> allSkills = new();
        [SerializeField] private List<ConsumableItem> allConsumableItems = new();

        [Space][SerializeField] private WeaponList weaponsOwned = null;
        [Space][SerializeField] private SkillList skillsOwned = null;
        [Space][SerializeField] private ConsumableItemList itemsOwned = null;


        public WeaponList WeaponsOwned => weaponsOwned;
        public SkillList SkillsOwned => skillsOwned;
        public ConsumableItemList ItemsOwned => itemsOwned;

        public List<Weapon> AllWeapons => allWeapons;
        public List<Skill> AllSkills => allSkills;
        public List<ConsumableItem> AllConsumableItems => allConsumableItems;


        public readonly string WEAPONS_KEY = "InventoryWeapons";
        public readonly string SKILLS_KEY = "InventorySkills";
        public readonly string CONSUMABLES_KEY = "InventoryConsumables";
        public readonly string WEAPON1 = "InventoryWeapon1";
        public readonly string WEAPON2 = "InventoryWeapon2";
        public readonly string SKILL1 = "InventorySkill1";
        public readonly string SKILL2 = "InventorySkill2";
        public readonly string SKILL3 = "InventorySkill3";
        public readonly string SKILL4 = "InventorySkill4";
        public readonly string SKILL5 = "InventorySkill5";
        public readonly string ITEM1 = "InventoryItem1";
        public readonly string ITEM2 = "InventoryItem2";
        public readonly string ITEM3 = "InventoryItem3";


        private static T LoadVariable<T>(List<T> references, string key) where T : ScriptableObject
        {
            var index = PlayerPrefs.GetInt(key, -1);
            return index != -1 ? references[index] : null;
        }

        private static void LoadList<T>(ListCollection<T> toLoad, List<T> references, string key) where T : ScriptableObject
        {
            toLoad.Clear();

            var loaded = PlayerPrefs.GetString(key, "");
            if (loaded != "")
                toLoad.Value.AddRange(loaded.Split(',').Select(int.Parse).ToList().Select(x => references[x]));

        }

        private static void SaveVariable<T>(T variable, List<T> references, string key)
        {
            PlayerPrefs.SetInt(key, variable == null ? -1 : references.IndexOf(variable));
        }

        private static void SaveList<T>(ListCollection<T> toSave, List<T> references, string key) where T : ScriptableObject
        {
            PlayerPrefs.SetString(key, string.Join(',', toSave.Value.Select(x => references.IndexOf(x))));
        }

        private string GetItemKey(int key)
        {
            return key switch
            {
                0 => ITEM1,
                1 => ITEM2,
                2 => ITEM3,
                _ => "",
            };
        }


        public void SaveWeapons()
        {
            SaveVariable(MainWeapon, AllWeapons, WEAPON1);
            SaveVariable(SecondWeapon, AllWeapons, WEAPON2);

            SaveList(WeaponsOwned, AllWeapons, WEAPONS_KEY);
        }

        public void SaveSkills()
        {
            SaveVariable(Technologys[0], AllSkills, SKILL1);
            SaveVariable(Technologys[1], AllSkills, SKILL2);
            SaveVariable(Technologys[2], AllSkills, SKILL3);
            SaveVariable(Technologys[3], AllSkills, SKILL4);
            SaveVariable(Technologys[4], AllSkills, SKILL5);

            SaveList(SkillsOwned, AllSkills, SKILLS_KEY);
        }

        public void SaveItems()
        {
            SaveVariable(Items[0], AllConsumableItems, ITEM1);
            SaveVariable(Items[1], AllConsumableItems, ITEM2);
            SaveVariable(Items[2], AllConsumableItems, ITEM3);

            SaveList(ItemsOwned, AllConsumableItems, CONSUMABLES_KEY);
        }

        public void LoadAll()
        {
            MainWeapon = LoadVariable(AllWeapons, WEAPON1);
            SecondWeapon = LoadVariable(AllWeapons, WEAPON2);

            Technologys[0] = LoadVariable(AllSkills, SKILL1);
            Technologys[1] = LoadVariable(AllSkills, SKILL2);
            Technologys[2] = LoadVariable(AllSkills, SKILL3);
            Technologys[3] = LoadVariable(AllSkills, SKILL4);
            Technologys[4] = LoadVariable(AllSkills, SKILL5);

            Items[0] = LoadVariable(AllConsumableItems, ITEM1);
            Items[1] = LoadVariable(AllConsumableItems, ITEM2);
            Items[2] = LoadVariable(AllConsumableItems, ITEM3);

            LoadList(WeaponsOwned, AllWeapons, WEAPONS_KEY);
            LoadList(SkillsOwned, AllSkills, SKILLS_KEY);
            LoadList(ItemsOwned, AllConsumableItems, CONSUMABLES_KEY);


        }

        public void RemoveItemAfterUse(int key)
        {
            SaveVariable(null, AllConsumableItems, GetItemKey(key));
        }

        public void SaveAll()
        {
            SaveWeapons();
            SaveSkills();
            SaveItems();
        }


        public int ItemCount(ConsumableItem consumableItem)
        {
            int count = 0;
            foreach (ConsumableItem selectedConsumableItem in Items)
            {
                if (consumableItem.Equals(selectedConsumableItem))
                {
                    count++;
                }
            }
            return count;
        }
    }
}
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Localization;

namespace Assets.Scripts.Inventory
{
    public abstract class Item : ScriptableObject
    {

        [field: SerializeField, FoldoutGroup("Visual")]
        public int MassCost { private set; get; } = 0;

        [field: SerializeField, FoldoutGroup("Visual")]
        public int RequiredZealyLevel { private set; get; } = 0;

        [field: SerializeField, FoldoutGroup("Visual")]
        public Sprite Sprite { private set; get; } = null;

        [field: SerializeField, FoldoutGroup("Visual")]
        public ItemType Type { private set; get; } = null;

        [field: SerializeField, FoldoutGroup("Visual")]
        public Rarity Rarity { private set; get; } = Rarity.Common;

        /// <summary>
        /// Define Long name of specific item
        /// </summary>
        [field: SerializeField, FoldoutGroup("Visual")]
        public LocalizedString localizedStringLong;

        /// <summary>
        /// Define Short name of specific item
        /// </summary>
        [field: SerializeField, FoldoutGroup("Visual")]
        public LocalizedString localizedStringShort;
        
        /// <summary>
        /// Define Short name of specific item
        /// </summary>
        [field: SerializeField, FoldoutGroup("Visual")]
        public LocalizedString localizedStringDescription;
    }
}
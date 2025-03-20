using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Localization;

namespace Assets.Scripts.Questlog
{
    [System.Serializable]
    public class QuestInfo
    {
        [field: SerializeField] public string Name { private set; get; } = "Name";
        [field: SerializeField] public LocalizedString NameLocale { private set; get; }
        [field: SerializeField] public string ObjectiveName { private set; get; } = "Objective Name";
        [field: SerializeField] public LocalizedString ObjectiveNameLocale { private set; get; }
        
        [field: SerializeField, TextArea(3, 8)] public string Title { private set; get; } = "Title";
        [field: SerializeField] public LocalizedString TitleLocale { private set; get; }
        [field: SerializeField, TextArea(3, 8)] public string Description { private set; get; } = "Mission description";
        [field: SerializeField] public LocalizedString DescriptionLocale { private set; get; }
        [field: SerializeField, Tooltip("Max 5.")] public List<Order> Orders { private set; get; } = new List<Order>();
        [field: SerializeField, TextArea(2, 4)] public string Attention { private set; get; } = "Attention";
        [field: SerializeField] public LocalizedString AttentionLocale { private set; get; }
        [field: SerializeField, TextArea(3, 8)] public string Signature { private set; get; } = "Signature";
        [field: SerializeField] public LocalizedString SignatureLocale { private set; get; }
        [field: SerializeField, Space] public Sprite MapSprite { private set; get; } = null;
        [field: SerializeField] public Sprite BiomeSprite { private set; get; } = null;
    }

    [System.Serializable]
    public class Order
    {
        [field: SerializeField, TextArea(2, 4)] public string Title { private set; get; } = "Oeder title";
        [field: SerializeField] public LocalizedString OrderTitleLocale { private set; get; }
        [field: SerializeField, TextArea(1, 3), Tooltip("Max 3.")] public List<string> Descriptions { private set; get; } = new();
        [field: SerializeField] public List<LocalizedString> OrderDescriptionsLocale { private set; get; }
    }
}
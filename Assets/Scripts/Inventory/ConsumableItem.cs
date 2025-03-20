using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Inventory
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Inventory/ConsumableItem")]
    public class ConsumableItem : Item
    {
        [field: FoldoutGroup("Functional"), SerializeField] public int MaxUses { get; private set; }
        [field: FoldoutGroup("Functional"), SerializeField, Min(0)] public float Cooldown { private set; get; } = 10;
        [field: FoldoutGroup("Functional"), SerializeReference] public Skills.Condition.SkillCondition Condition { private set; get; } = null;
        [field: FoldoutGroup("Functional"), SerializeReference] public Skills.Action.SkillAction Action { private set; get; } = null;
        [field: FoldoutGroup("Functional"), SerializeField] public FMODUnity.EventReference UseSound { private set; get; } = default;
    }
}
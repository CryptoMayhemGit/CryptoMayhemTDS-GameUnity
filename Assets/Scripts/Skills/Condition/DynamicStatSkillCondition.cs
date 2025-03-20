using UnityEngine;

namespace Assets.Scripts.Skills.Condition
{
    public class DynamicStatSkillCondition : SkillCondition
    {
        private enum Type { Max, Min }

        [SerializeField] private Stats.StatType statType = null;
        [SerializeField] private Type type = Type.Max;
        [SerializeField] private bool inverse = false;

        public override bool Check(Containers.CharacterContainer container)
        {
            bool result = type switch
            {
                Type.Max => container.Stats.GetDynamicStat(statType).DynamicValue == container.Stats.GetStat(statType).Value,
                Type.Min => container.Stats.GetDynamicStat(statType).DynamicValue == 0,
                _ => throw new System.NotImplementedException(),
            };

            return inverse ? !result : result;
        }
    }
}
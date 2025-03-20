using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class ChangeCharacterDynamicStatSlillAction : SkillAction
    {
        private enum Type { Flat, Percent }

        [SerializeField] private Stats.StatType statType = null;
        [SerializeField] private Type type = Type.Flat;
        [SerializeField] private float value = 0f;

        public override void Trigger(Containers.CharacterContainer origin, Vector3 targetPosition)
        {
            if (type == Type.Flat)
                origin.Stats.GetDynamicStat(statType).ModifyDynamicValue(value);
            else
                origin.Stats.GetDynamicStat(statType).ModifyPercentDynamicValue(value);
        }
    }
}
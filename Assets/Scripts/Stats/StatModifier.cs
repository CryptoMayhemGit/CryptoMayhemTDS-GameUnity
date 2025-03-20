using UnityEngine;

namespace Assets.Scripts.Stats
{
    [System.Serializable]
    public class StatModifier
    {
        private enum Type { Flat, Percent }

        [SerializeField] private Type type = Type.Flat;
        [SerializeField] private StatType stat = null;
        [SerializeField] private float value = 0f;

        public void Apply(CharacterStats target)
        {
            if (type == Type.Flat)
                target.GetStat(stat).AddFlatModifier(this, value);
            else if (type == Type.Percent)
                target.GetStat(stat).AddPercentModifier(this, value);
        }

        public void Misapply(CharacterStats target)
        {
            if (type == Type.Flat)
                target.GetStat(stat).RemoveFlatModifire(this);
            else if (type == Type.Percent)
                target.GetStat(stat).RemovePercentModifire(this);
        }
    }
}
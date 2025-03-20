using UnityEngine;

namespace Assets.Scripts.Stats
{
    public class DynamicStat : Stat
    {
        public event System.Action<float> OnDynamicValueChange;

        public override float Value
        {
            get => base.Value;

            protected set
            {
                if (value > base.Value)
                {
                    DynamicValue += value - base.Value;
                    OnDynamicValueChange?.Invoke(DynamicValue);
                }
                else if (value < DynamicValue)
                {
                    DynamicValue = value;
                    OnDynamicValueChange?.Invoke(DynamicValue);
                }

                base.Value = value;
            }
        }

        public float DynamicValue { private set; get; }

        public DynamicStat(float baseValue) : base(baseValue)
        {
            DynamicValue = baseValue;
        }

        public override void Restore()
        {
            base.Restore();
            DynamicValue = baseValue;
        }

        public void ModifyDynamicValue(float value)
        {
            float newDynamicValue = Mathf.Clamp(DynamicValue + value, 0, Value);

            if (newDynamicValue != DynamicValue)
            {
                DynamicValue = newDynamicValue;
                OnDynamicValueChange?.Invoke(DynamicValue);
            }
        }

        public void ModifyPercentDynamicValue(float value)
        {
            float newDynamicValue = Mathf.Clamp(DynamicValue + (baseValue * value * 0.01f), 0f, baseValue);

            if (newDynamicValue != DynamicValue)
            {
                DynamicValue = newDynamicValue;
                OnDynamicValueChange?.Invoke(DynamicValue);
            }
        }
    }
}
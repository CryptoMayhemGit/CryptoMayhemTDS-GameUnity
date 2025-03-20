using System.Collections.Generic;

namespace Assets.Scripts.Stats
{
    public class Stat
    {
        public event System.Action<float> OnValueChange;

        private readonly Dictionary<StatModifier, float> flatModifires = new();
        private readonly Dictionary<StatModifier, float> percentModifires = new();

        protected float baseValue;

        public virtual float Value { protected set; get; }

        public Stat(float baseValue)
        {
            Value = this.baseValue = baseValue;
        }

        public virtual void Restore()
        {
            flatModifires.Clear();
            percentModifires.Clear();
            Value = baseValue;
        }

        public void AddFlatModifier(StatModifier source, float value)
        {
            flatModifires.Add(source, value);
            CalculateFinalValue();
        }

        public void AddPercentModifier(StatModifier source, float value)
        {
            percentModifires.Add(source, value);
            CalculateFinalValue();
        }

        public void RemoveFlatModifire(StatModifier source)
        {
            flatModifires.Remove(source);
            CalculateFinalValue();
        }

        public void RemovePercentModifire(StatModifier source)
        {
            percentModifires.Remove(source);
            CalculateFinalValue();
        }

        private void CalculateFinalValue()
        {
            float flatValues = 0f;
            float percentValues = 100f;

            foreach (var value in flatModifires.Values)
                flatValues += value;

            foreach (var value in percentModifires.Values)
                percentValues += value;

            Value = (baseValue + flatValues) * percentValues * .01f;
            OnValueChange?.Invoke(Value);
        }
    }
}
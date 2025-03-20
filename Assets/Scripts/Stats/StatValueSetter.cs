using UnityEngine;

namespace Assets.Scripts.Stats
{
    public class StatValueSetter : CharacterComponent
    {
        [SerializeField] private CachedStat cachedStat = new();
        [SerializeField] private UltEvents.UltEvent<float> onUpdate = new();

        private void Start()
        {
            cachedStat.Get().OnValueChange += UpdateValue;

            UpdateValue(cachedStat.Get().Value);
        }

        private void OnDestroy() => cachedStat.Get().OnValueChange -= UpdateValue;

        private void UpdateValue(float value) => onUpdate.Invoke(value);
    }
}
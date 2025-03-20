using Assets.Scripts.Containers;
using Assets.Scripts.Stats;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIDynamicStatImageFiller : UIPlayer
    {
        [SerializeField] private StatType statType = null;
        [SerializeField] private UnityEngine.UI.Image image = null;

        private float current;
        private float max;

        protected override void Enable(PlayerContainer playerContainer)
        {
            var dynamicStat = playerContainer.Stats.GetDynamicStat(statType);

            dynamicStat.OnValueChange += RefreshMax;
            dynamicStat.OnDynamicValueChange += RefreshCurrent;

            current = dynamicStat.DynamicValue;
            max = dynamicStat.Value;

            RefreshFill();
        }

        protected override void Disable(PlayerContainer playerContainer)
        {
            var dynamicStat = playerContainer.Stats.GetDynamicStat(statType);

            dynamicStat.OnValueChange -= RefreshMax;
            dynamicStat.OnDynamicValueChange -= RefreshCurrent;
        }

        private void RefreshCurrent(float value)
        {
            current = value;
            RefreshFill();
        }

        private void RefreshMax(float value)
        {
            max = value;
            RefreshFill();
        }

        private void RefreshFill() => image.fillAmount = current / max;
    }
}
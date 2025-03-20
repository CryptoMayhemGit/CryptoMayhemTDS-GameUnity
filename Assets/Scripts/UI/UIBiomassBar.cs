using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIBiomassBar : UIPlayer
    {
        [SerializeField] private Stats.StatType biomassStat = null;
        [SerializeField] private Image leftBar = null;
        [SerializeField] private Image rightBar = null;

        private float current;
        private float max;

        protected override void Enable(PlayerContainer playerContainer)
        {
            var playerBiomass = playerContainer.Stats.GetDynamicStat(biomassStat);

            playerBiomass.OnDynamicValueChange += RefreshCurrentValues;
            playerBiomass.OnValueChange += RefreshMaxValues;

            current = playerBiomass.DynamicValue;
            max = playerBiomass.Value;

            RefreshFill();
        }

        protected override void Disable(PlayerContainer playerContainer)
        {
            var playerBiomass = playerContainer.Stats.GetDynamicStat(biomassStat);

            playerBiomass.OnDynamicValueChange -= RefreshCurrentValues;
            playerBiomass.OnValueChange -= RefreshMaxValues;
        }

        private void RefreshCurrentValues(float value)
        {
            current = value;
            RefreshFill();
        }

        private void RefreshMaxValues(float value)
        {
            max = value;
            RefreshFill();
        }

        private void RefreshFill()
        {
            leftBar.fillAmount = current / max;
            rightBar.fillAmount = current / max;
        }
    }
}
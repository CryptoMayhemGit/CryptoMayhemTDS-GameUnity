using Assets.Scripts.Containers;
using Assets.Scripts.Stats;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIBossBar : MonoBehaviour
    {
        [SerializeField] private StatType statType = null;
        [SerializeField] private Image image = null;

        private CharacterContainer container;
        private CharacterStats stats;
        private DynamicStat dynamicStat;

        public CharacterContainer Container => container;

        public void Init(CharacterContainer container)
        {
            this.container = container;
            stats = container.Stats;
            dynamicStat = stats.GetDynamicStat(statType);
        }

        private void OnEnable()
        {
            dynamicStat.OnValueChange += RefreshFill;
            dynamicStat.OnDynamicValueChange += RefreshFill;
            RefreshFill(0f);
        }

        private void OnDisable()
        {
            dynamicStat.OnValueChange -= RefreshFill;
            dynamicStat.OnDynamicValueChange -= RefreshFill;
        }

        private void RefreshFill(float value) => image.fillAmount = dynamicStat.DynamicValue / dynamicStat.Value;
    }
}
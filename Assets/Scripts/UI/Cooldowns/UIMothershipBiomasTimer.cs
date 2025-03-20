using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Assets.Scripts.Containers;

namespace Assets.Scripts.UI.Cooldowns
{
    public class UIMothershipBiomasTimer : UIPlayer
    {
        [SerializeField, Space] private SOArchitecture.GameManagerVariable gameManager;
        [SerializeField] private Stats.StatType statType;

        [SerializeField] private TextMeshProUGUI timerText;
        [SerializeField] private Image fillImage;

        PlayerContainer playerContainer;
        private float timer;
        private float second;

        protected override void Enable(PlayerContainer newContainer)
        {
            playerContainer = newContainer;

            second = 0;
            fillImage.fillAmount = 0;
            timer = playerContainer.Backpack.BackpackReleaseCooldown;
            timerText.text = GetTime(timer);

            playerContainer.Stats.GetDynamicStat(statType).OnDynamicValueChange += OnChangedValue;
            playerContainer.Backpack.OnSendedMothershipBiomass.DynamicCalls += OffTimer;
            gameManager.Value.OnUpdate += OnChangedTime;
        }

        protected override void Disable(PlayerContainer newContainer)
        {
            playerContainer.Stats.GetDynamicStat(statType).OnDynamicValueChange -= OnChangedValue;
            playerContainer.Backpack.OnSendedMothershipBiomass.DynamicCalls -= OffTimer;
            gameManager.Value.OnUpdate -= OnChangedTime;
        }

        private void OnChangedValue(float value)
        {
            fillImage.fillAmount = value / playerContainer.Backpack.MaxBiomassPerLevel;
        }

        private void OnChangedTime()
        {
            if ((second -= Time.deltaTime) < 0)
            {
                second = 1;
                --timer;

                if (timer < 0)
                    timer = playerContainer.Backpack.BackpackReleaseCooldown;

                timerText.text = GetTime(timer);
            }
        }

        private string GetTime(float value)
        {
            var time = System.TimeSpan.FromSeconds(value);

            return time.ToString(@"mm\.ss");
        }

        private void OffTimer()
        {
            Disable(null);
            gameObject.SetActive(false);
        }
    }
}
using Assets.Scripts.Questlog;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIMissionView : MonoBehaviour
    {
        private const string KEY_INVESTOR = "IS_INVESTOR";
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";
        [SerializeField] private Image image;
        [SerializeField] private QuestData ButtonQuest = null;
        [SerializeField] private GameObject GameObjectDisableLockIcon = null;

        public void SetCollors()
        {
            int isInvestor = PlayerPrefs.GetInt(KEY_INVESTOR);
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);

            if (ButtonQuest.IsInvestorPremiumMode && isInvestor == 0)
            {
                DisableMissionButton();
            }
            else if(ButtonQuest.ZealyRequiredLevel > zealyLevel)
            {
                DisableMissionButton();
            }
            else
            {
                EnableMissionButton();
            }

        }

        private void DisableMissionButton()
        {
            image.color = Color.red;
            GameObjectDisableLockIcon.SetActive(true);
        }

        private void EnableMissionButton()
        {
            image.color = Color.green;
            GameObjectDisableLockIcon.SetActive(false);
        }
    }
}
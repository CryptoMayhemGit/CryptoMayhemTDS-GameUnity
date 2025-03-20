using Assets.Scripts.Questlog;
using Assets.Scripts.SOArchitecture;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIHangarButtonView : MonoBehaviour
    {
        private const string KEY_INVESTOR = "IS_INVESTOR";
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";
        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] private Button hangarButton = null;
        private QuestData lastQuestData = null;

        private void OnDisable()
        {
            lastQuestData = null;
            hangarButton.image.color = Color.white;

        }

        public void SetCollors()
        {
            if(lastQuestData == questDataVariable.Value && hangarButton.image.color != Color.white)
            {
                hangarButton.image.color = Color.white;
                return;
            }

            int isInvestor = PlayerPrefs.GetInt(KEY_INVESTOR);
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);

            if (questDataVariable.Value.IsInvestorPremiumMode && isInvestor == 0)
            {
                hangarButton.image.color = Color.red;
            }
            else if (questDataVariable.Value.ZealyRequiredLevel > zealyLevel)
            {
                hangarButton.image.color = Color.red;
            }
            else
            {
                hangarButton.image.color = Color.green;
            }

            lastQuestData = questDataVariable.Value;
        }
    }
}
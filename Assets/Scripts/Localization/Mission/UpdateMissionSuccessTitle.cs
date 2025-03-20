using Assets.Scripts.Questlog;
using Assets.Scripts.SOArchitecture;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;

namespace Assets.Scripts.Localization.Mission
{
    public class UpdateMissionSuccessTitle : MonoBehaviour
    {
        [SerializeField] private LocalizedString localizedStringHardModeSuccessTitle;
        [SerializeField] private LocalizedString localizedStringDesinsectionSuccessTitle;
        [SerializeField] private LocalizedString localizedStringSurviveSuccessTitle;

        [SerializeField] private TextMeshProUGUI textTitleLabel;

        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] private QuestData hardModeQuestData = null;
        [SerializeField] private QuestData desinsectionQuestData = null;
        [SerializeField] private QuestData surviveQuestData = null;

        private void OnEnable()
        {
            string SuccessTitle = "";

            if(questDataVariable.Value == hardModeQuestData)
            {
                SuccessTitle = localizedStringHardModeSuccessTitle.GetLocalizedString();

            }
            else if(questDataVariable.Value == desinsectionQuestData)
            {
                SuccessTitle = localizedStringDesinsectionSuccessTitle.GetLocalizedString();
            }
            else if (questDataVariable.Value == surviveQuestData)
            {
                SuccessTitle = localizedStringSurviveSuccessTitle.GetLocalizedString();
            }
            else
            {
                Debug.Log("The mission has not been defined.");
            }

            textTitleLabel.text = SuccessTitle;
        }
    }
}

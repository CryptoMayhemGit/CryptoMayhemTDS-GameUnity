using Assets.Scripts.SOArchitecture;
using FMODUnity;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    [RequireComponent(typeof(UIHangarButtonView))]
    public class UIPremiumMission : MonoBehaviour
    {
        private const string KEY_INVESTOR = "IS_INVESTOR";
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";
        [SerializeField] private Button buton;
        [SerializeField] private IntEvent changerMenuVeiew = null;
        [SerializeField] private GameObject InvestorPanelGameObject = null;
        [SerializeField] private GameObject ZealyPanelGameObject = null;
        [SerializeField] private QuestDataVariable mainQuestData = null;
        [SerializeField] private StudioEventEmitter studioEventEmitter = null;
        [SerializeField] private UIHangarButtonView uiHangarButtonView = null;

        public void UpdatePremiumMissions()
        {
            buton.onClick.RemoveAllListeners();

            int isInvestor = PlayerPrefs.GetInt(KEY_INVESTOR);
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);

            if (mainQuestData.Value.IsInvestorPremiumMode && isInvestor == 0)
            {
                buton.onClick.AddListener(() => { InvestorPanelGameObject.SetActive(true); });
            }
            else if (mainQuestData.Value.ZealyRequiredLevel > zealyLevel)
            {
                buton.onClick.AddListener(() => { ZealyPanelGameObject.SetActive(true); });
            }
            else
            {
                buton.onClick.AddListener(() => { studioEventEmitter.Play(); changerMenuVeiew.Raise(2); });
            }

            uiHangarButtonView.SetCollors();
        }
    }
}
using Assets.Scripts.Questlog;
using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.Lights
{
    public class PlayerLightNihtMode : MonoBehaviour
    {
        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] private QuestData NightQuestData = null;

        [SerializeField] private GameObject NightLights = null;
        [SerializeField] private GameObject DayLights = null;


        private void Awake()
        {
            if (NightQuestData == questDataVariable.Value)
            {
                NightLights.SetActive(true);
                DayLights.SetActive(false);
            }
            else
            {
                NightLights.SetActive(false);
                DayLights.SetActive(true);
            }
        }
    }
}
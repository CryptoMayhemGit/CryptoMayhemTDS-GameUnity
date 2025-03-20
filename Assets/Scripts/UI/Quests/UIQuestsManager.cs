using Assets.Scripts.SOArchitecture;
using UltEvents;
using UnityEngine;

namespace Assets.Scripts.UI.Quests
{
    public class UIQuestsManager : MonoBehaviour
    {
        [SerializeField] private GameObject questContainer = null;
        [SerializeField] private Transform parentForQuests = null;
        [SerializeField] private QuestVariable mainQuest = null;
        [SerializeField] private QuestList sideQuestList = null;
        [SerializeField] private UltEvent mainQuestCompletedEvent = new();
        [SerializeField] private UltEvent mainQuestFailedEvent = new();

        public void Init()
        {
            Instantiate(questContainer, parentForQuests).GetComponent<UIQuestContainer>().Init(mainQuest);

            for (int i = 0; i < sideQuestList.Value.Count; i++)
                Instantiate(questContainer, parentForQuests).GetComponent<UIQuestContainer>().Init(sideQuestList.Value[i]);

            mainQuest.Value.OnQuestCompleted += MainQuestCompleted;
            mainQuest.Value.OnQuestFailed += MainQuestFailed;
        }

        private void MainQuestCompleted()
        {
            mainQuestCompletedEvent.Invoke();
            mainQuest.Value.OnQuestCompleted -= MainQuestCompleted;
            mainQuest.Value.OnQuestFailed -= MainQuestFailed;
        }

        private void MainQuestFailed()
        {
            mainQuestFailedEvent.Invoke();
            mainQuest.Value.OnQuestCompleted -= MainQuestCompleted;
            mainQuest.Value.OnQuestFailed -= MainQuestFailed;
        }

        private void OnDestroy()
        {
            mainQuest.Value.OnQuestCompleted -= MainQuestCompleted;
            mainQuest.Value.OnQuestFailed -= MainQuestFailed;
        }
    }
}
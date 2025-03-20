using Assets.Scripts.Questlog;
using UnityEngine;
using TMPro;

namespace Assets.Scripts.UI.Quests
{
    public class UIQuestContainer : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI title = null;
        [SerializeField] private Transform parentForTasks = null;

        private Quest quest;

        public void Init(Quest quest)
        {
            this.quest = quest;
            title.text = quest.QuestData.QuestInfo.ObjectiveNameLocale is { IsEmpty: false }
                ? $"- {quest.QuestData.QuestInfo.ObjectiveNameLocale.GetLocalizedString()}"
                : $"- {quest.QuestData.QuestInfo.ObjectiveName}";
            for (int i = 0; i < quest.QuestData.SuccessTasks.Count; i++)
                Instantiate(quest.QuestData.SuccessTasks[i].UIPrefab, parentForTasks).GetComponent<UITask>()
                    .Init(quest.SuccessTasks[i]);

            for (int i = 0; i < quest.QuestData.FailTasks.Count; i++)
                Instantiate(quest.QuestData.FailTasks[i].UIPrefab, parentForTasks).GetComponent<UITask>()
                    .Init(quest.FailTasks[i]);

            quest.OnQuestCompleted += Complete;
            quest.OnQuestFailed += Fail;
        }

        private void Complete()
        {
            quest.OnQuestCompleted -= Complete;
            quest.OnQuestFailed -= Fail;
            Destroy(gameObject);
        }

        private void Fail()
        {
            quest.OnQuestCompleted -= Complete;
            quest.OnQuestFailed -= Fail;
            Destroy(gameObject);
        }

        private void OnDestroy()
        {
            quest.OnQuestCompleted -= Complete;
            quest.OnQuestFailed -= Fail;
        }
    }
}
using System;
using System.Collections.Generic;

namespace Assets.Scripts.Questlog
{
    public class Quest
    {
        public IReadOnlyList<Task> SuccessTasks => successTasks;
        public IReadOnlyList<Task> FailTasks => failTasks;

        public event Action OnTaskCompleted;
        public event Action OnQuestCompleted;
        public event Action OnQuestFailed;
        public readonly QuestData QuestData;

        private int currentAmount;
        private List<Task> successTasks = new();
        private List<Task> failTasks = new();

        public Quest(QuestData questData)
        {
            QuestData = questData;

            for (int i = 0; i < questData.SuccessTasks.Count; i++)
            {
                Task task = new Task(questData.SuccessTasks[i].TaskData, questData.SuccessTasks[i].RequiredAmount);
                successTasks.Add(task);
                task.OnComplete += Progress;
            }

            for (int i = 0; i < questData.FailTasks.Count; i++)
            {
                Task task = new Task(questData.FailTasks[i].TaskData, questData.FailTasks[i].RequiredAmount);
                failTasks.Add(task);
                task.OnComplete += Fail;
            }
        }

        private void Progress()
        {
            currentAmount += 1;
            OnTaskCompleted?.Invoke();
            if (currentAmount == QuestData.SuccessTasks.Count)
                Complete();
        }

        private void Complete()
        {
            OnQuestCompleted?.Invoke();
            EndQuest();
        }

        private void Fail()
        {
            OnQuestFailed?.Invoke();
            EndQuest();
        }

        private void EndQuest()
        {
            for (int i = 0; i < successTasks.Count; i++)
            {
                successTasks[i].OnComplete -= Progress;
            }
            for (int i = 0; i < failTasks.Count; i++)
            {
                failTasks[i].OnComplete -= Progress;
            }
        }
    }
}
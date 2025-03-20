using System;

namespace Assets.Scripts.Questlog
{
    public class Task
    {
        public int RequiredAmount { get; private set; }
        public int CurrentAmount { get; private set; }

        public event Action OnUpdate;
        public event Action OnComplete;
        public readonly TaskData TaskData;

        public Task(TaskData taskData, int requiredAmount)
        {
            TaskData = taskData;
            RequiredAmount = requiredAmount;

            for (int i = 0; i < taskData.GameEvents.Count; i++)
            {
                taskData.GameEvents[i].AddListener(Progress);
            }

            TaskData.Init();
        }

        private void Progress()
        {
            CurrentAmount += 1;
            OnUpdate?.Invoke();
            if (CurrentAmount == RequiredAmount)
                Complete();
        }

        private void Complete()
        {
            OnComplete?.Invoke();
            for (int i = 0; i < TaskData.GameEvents.Count; i++)
            {
                TaskData.GameEvents[i].RemoveListener(Progress);
            }
        }
    }
}
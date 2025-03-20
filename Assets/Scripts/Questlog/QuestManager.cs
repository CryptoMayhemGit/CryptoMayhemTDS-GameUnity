using Assets.Scripts.SOArchitecture;
using UltEvents;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Questlog
{
    [CreateAssetMenu(fileName = "Quest", menuName = "ScriptableObjects/Manager/Quest")]
    public class QuestManager : Manager.Manager
    {
        [SerializeField] private GameEvent onUpdateTimerEvent = null;
        [SerializeField] private QuestVariable mainQuest = null;
        [SerializeField] private QuestList sideQuests = null;
        [SerializeField] private QuestDataVariable mainQuestData = null;
        [SerializeField] private QuestDataList sideQuestsData = null;
        [SerializeField] private GameManagerVariable gameManager = null;

        private float nextUpdate;

        public override void Init() => RefreshQuests();

        public override void Enable() => gameManager.Value.OnUpdate += UpdateTimer;

        public override void Disable() => gameManager.Value.OnUpdate -= UpdateTimer;

        private void UpdateTimer()
        {
            Profiler.BeginSample("QuestManager.UpdateTimer");
            if ((nextUpdate += Time.deltaTime) >= 1f)
            {
                nextUpdate -= 1;
                onUpdateTimerEvent.Raise();
            }
            Profiler.EndSample();
        }

        private void RefreshQuests()
        {
            mainQuest.Value = new Quest(mainQuestData.Value);
            sideQuests.Clear();

            for (int i = 0; i < sideQuestsData.Value.Count; i++)
                sideQuests.Add(new Quest(sideQuestsData.Value[i]));
        }
    }
}
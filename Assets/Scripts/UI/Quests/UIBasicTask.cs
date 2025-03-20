using Assets.Scripts.Questlog;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI.Quests
{
    public class UIBasicTask : UITask
    {
        [SerializeField] private TextMeshProUGUI currentProgress = null;

        public override void Init(Task task)
        {
            base.Init(task);
            currentProgress.text = $"{task.CurrentAmount.ToString()} / {task.RequiredAmount.ToString()}";
        }

        protected override void UpdateUI() => currentProgress.text = $"{task.CurrentAmount.ToString()} / {task.RequiredAmount.ToString()}";
    }
}
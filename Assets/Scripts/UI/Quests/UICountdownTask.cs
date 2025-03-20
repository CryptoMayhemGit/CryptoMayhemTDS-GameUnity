using Assets.Scripts.Questlog;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI.Quests
{
    public class UICountdownTask : UITask
    {
        [SerializeField] private TextMeshProUGUI currentProgress = null;

        public override void Init(Task task)
        {
            base.Init(task);
            UpdateProgressText(task);
        }

        protected override void UpdateUI() => UpdateProgressText(task);

        private void UpdateProgressText(Task proggressTask)
        {
            currentProgress.text = (proggressTask.RequiredAmount - proggressTask.CurrentAmount).ToString();
        }
    }
}
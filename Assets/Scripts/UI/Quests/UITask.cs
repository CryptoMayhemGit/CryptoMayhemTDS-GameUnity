using Assets.Scripts.Questlog;
using TMPro;
using UnityEngine;
using UnityEngine.Localization;

namespace Assets.Scripts.UI.Quests
{
    public abstract class UITask : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI description = null;

        protected Task task;

        public virtual void Init(Task task)
        {
            this.task = task;
            description.text = task.TaskData.DescriptionLocale is { IsEmpty: false } ? task.TaskData.DescriptionLocale.GetLocalizedString() : task.TaskData.Description;
            task.OnUpdate += UpdateUI;
            task.OnComplete += Complete;
        }

        protected abstract void UpdateUI();

        private void Complete()
        {
            task.OnUpdate -= UpdateUI;
            task.OnComplete -= Complete;
        }
    }
}
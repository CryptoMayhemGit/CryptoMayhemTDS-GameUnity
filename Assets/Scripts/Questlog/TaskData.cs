using UnityEngine;
using System.Collections.Generic;
using UltEvents;
using UnityEngine.Localization;

namespace Assets.Scripts.Questlog
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Quest/Task")]
    public class TaskData : ScriptableObject
    {
        [field: SerializeField] public string Description { private set; get; } = "";
        [field: SerializeField] public LocalizedString DescriptionLocale { private set; get; }

        [SerializeField] private UltEvent OnTaskStart = new();
        [SerializeField] private List<GameEvent> gameEvents = new();

        public IReadOnlyList<GameEvent> GameEvents => gameEvents;

        public void Init()
        {
            OnTaskStart.Invoke();
        }
    }
}
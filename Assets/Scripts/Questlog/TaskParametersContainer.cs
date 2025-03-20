using UnityEngine;

namespace Assets.Scripts.Questlog
{
    [System.Serializable]
    public class TaskParametersContainer
    {
        [field: SerializeField] public TaskData TaskData { set; get; } = null;
        [field: SerializeField, Min(1)] public int RequiredAmount { set; get; } = 1;
        [field: SerializeField] public GameObject UIPrefab { set; get; } = null;
    }
}
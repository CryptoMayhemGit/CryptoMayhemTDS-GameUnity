using UnityEngine;

namespace Assets.Scripts.SOArchitecture
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Quest/MapConfigurationSpawner")]
    public class MapConfigurationSpawner : ScriptableObject
    {
        [SerializeField] private QuestDataVariable questDataVariable = null;

        public void Init()
        {
            Instantiate(questDataVariable.Value.MapConfiguration, null);
        }
    }
}
using UnityEngine;

namespace Assets.Scripts
{
    public class PathfindingLoader : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.QuestDataVariable questData;
        [SerializeField] private AstarPath astar;

        private void Awake()
        {
            astar.data.file_cachedStartup = questData.Value.NavigationData;
            astar.data.LoadFromCache();
        }
    }
}
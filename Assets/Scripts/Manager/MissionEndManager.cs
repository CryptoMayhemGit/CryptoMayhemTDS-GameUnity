using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.Manager
{
    [CreateAssetMenu(fileName = "Mission End", menuName = "ScriptableObjects/Manager/MissionEnd")]
    public class MissionEndManager : Manager
    {
        [SerializeField] private PlayerContainerVariable player = null;
        [SerializeField] private GameEvent onMissionSuccess = null;
        [SerializeField] private GameEvent onMissionFailure = null;

        public void EndMissionSuccess()
        {
            player.Value.Backpack.AddBackpackValueToTemp();
            player.Value.Backpack.AddTempValueToMothership();
            onMissionSuccess.Raise();
        }

        public void EndMissionFailure() => onMissionFailure.Raise();
    }
}
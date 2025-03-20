using UnityEngine;

namespace Assets.Scripts.Manager
{
    public class PlayerSpawnManager : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.PlayerContainerVariable playerContainerVariable = null;
        [SerializeField] private Containers.PlayerContainer playerPrefab = null;
        [SerializeField] private Vector3 spawnPosition = Vector3.zero;

        public void Spawn()
        {
            var player = Instantiate(playerPrefab, spawnPosition, Quaternion.identity);
            player.Spawn();
            playerContainerVariable.Value = player;
            player.gameObject.SetActive(true);
        }
    }
}
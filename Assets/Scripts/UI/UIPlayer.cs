using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public abstract class UIPlayer : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.PlayerContainerVariable playerContainerVariable = null;
        [SerializeField] private GameObject canvasObject = null;

        private PlayerContainer currentPlayer;

        private void OnEnable() => playerContainerVariable.AddListener(OnPlayerChanged);
        private void OnDisable() => playerContainerVariable.RemoveListener(OnPlayerChanged);

        private void OnPlayerChanged(PlayerContainer playerContainer)
        {
            if (playerContainer == null)
            {
                Disable(currentPlayer);
                currentPlayer = null;
                canvasObject.SetActive(false);
            }
            else
            {
                currentPlayer = playerContainer;
                Enable(playerContainer);
                canvasObject.SetActive(true);
            }
        }

        protected abstract void Enable(PlayerContainer playerContainer);
        protected abstract void Disable(PlayerContainer playerContainer);
    }
}
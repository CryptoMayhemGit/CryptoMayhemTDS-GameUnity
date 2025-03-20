using UnityEngine;

public class PlayerContainerToTransformEventListener : MonoBehaviour
{
    [SerializeField] private Assets.Scripts.SOArchitecture.PlayerContainerVariable playerContainerVariable = null;
    [SerializeField] private UltEvents.UltEvent<Transform> response = new();

    private void OnEnable() => playerContainerVariable.AddListener(CallResponse);
    private void OnDisable() => playerContainerVariable.RemoveListener(CallResponse);

    private void CallResponse(Assets.Scripts.Containers.PlayerContainer player) => response.Invoke(player == null ? null : player.Transform);
}
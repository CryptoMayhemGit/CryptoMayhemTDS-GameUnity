using UnityEngine;

public class OnTriggerExitCaller : MonoBehaviour
{
    [SerializeField] private UltEvents.UltEvent<Collider> ultEvent = new();

    private void OnTriggerExit(Collider other) => ultEvent.Invoke(other);
}
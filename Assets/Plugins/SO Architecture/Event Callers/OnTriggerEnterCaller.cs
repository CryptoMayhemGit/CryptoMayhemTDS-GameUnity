using UnityEngine;

public class OnTriggerEnterCaller : MonoBehaviour
{
    [SerializeField] private UltEvents.UltEvent<Collider> ultEvent = new();

    private void OnTriggerEnter(Collider other) => ultEvent.Invoke(other);
}

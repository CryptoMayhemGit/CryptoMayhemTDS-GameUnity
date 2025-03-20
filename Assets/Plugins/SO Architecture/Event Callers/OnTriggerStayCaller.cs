using UnityEngine;

public class OnTriggerStayCaller : MonoBehaviour
{
    [SerializeField] private UltEvents.UltEvent<Collider> ultEvent = new();

    private void OnTriggerStay(Collider other) => ultEvent.Invoke(other);
}
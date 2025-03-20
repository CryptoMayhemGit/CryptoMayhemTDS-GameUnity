using Assets.Scripts.SOArchitecture;
using UnityEngine;

public class RescueItem : MonoBehaviour
{
    [SerializeField] private GameManagerVariable gameManager = null;
    [SerializeField, Min(0.1f)] private float rescueTime = 0.1f;
    [SerializeField] private UltEvents.UltEvent onRescued = new();

    private float rescueTimer = 0f;
    private bool rescueInProgress = false;

    private void OnEnable() => gameManager.Value.OnUpdate += ListenRescue;

    private void OnDisable() => gameManager.Value.OnUpdate -= ListenRescue;

    private void ListenRescue()
    {
        if (rescueInProgress && ((rescueTimer += Time.deltaTime) >= rescueTime))
        {
            rescueTimer -= rescueTime;
            rescueInProgress = false;
            onRescued?.Invoke();
        }
    }

    public void TriggerEnter() => rescueInProgress = true;

    public void TriggerExit()
    {
        rescueInProgress = false;
        rescueTimer = 0f;
    }
}

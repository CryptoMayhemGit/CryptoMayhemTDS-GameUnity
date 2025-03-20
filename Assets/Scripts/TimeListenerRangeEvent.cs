using UnityEngine;
using UltEvents;

public class TimeListenerRangeEvent : MonoBehaviour
{
    [SerializeField, Min(0)] private float waitToStartd = 1;
    [SerializeField, Min(1)] private float waitToEnd = 10;
    [SerializeField] private Assets.Scripts.SOArchitecture.GameManagerVariable gameManager = null;
    [SerializeField, Space] private UltEvent onStart = new();
    [SerializeField, Space] private UltEvent onEnd = new();

    private float timer;

    private void Start()
    {
        gameManager.Value.OnUpdate += CheckStart;
    }

    private void OnDestroy()
    {
        TryUnsubscribe();
    }

    private void CheckStart()
    {
        if ((timer += Time.deltaTime) > waitToStartd)
        {
            timer = 0;
            onStart?.Invoke();
            gameManager.Value.OnUpdate -= CheckStart;
            gameManager.Value.OnUpdate += CheckEnd;
        }
    }

    private void CheckEnd()
    {
        if ((timer += Time.deltaTime) > waitToEnd)
        {
            onEnd?.Invoke();
            gameManager.Value.OnUpdate -= CheckEnd;
            enabled = false;
        }
    }

    private void TryUnsubscribe()
    {
        if (timer < waitToStartd)
            gameManager.Value.OnUpdate -= CheckStart;
        else if (timer < waitToEnd)
            gameManager.Value.OnUpdate -= CheckEnd;
    }
}
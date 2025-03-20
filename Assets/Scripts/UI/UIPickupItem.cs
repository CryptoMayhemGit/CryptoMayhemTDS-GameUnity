using DG.Tweening;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIPickupItem : MonoBehaviour
    {
        private readonly Color INVISIBLE_COLOR = new Color(1f, 1f, 1f, 0f);
        private readonly Color WHITE_COLOR = new Color(1f, 1f, 1f, 1f);

        [SerializeField] private Assets.Scripts.SOArchitecture.Event.StringGameEvent onItemPickUp = null;
        [SerializeField, Min(0.1f)] private float transitionTime = 0.5f;
        [SerializeField, Min(0.1f)] private float displayTime = 1f;
        [SerializeField] private TextMeshProUGUI[] texts = new TextMeshProUGUI[0];

        private Queue<TextMeshProUGUI> textQueue = new();
        private Queue<string> itemQueue = new();

        private void Awake()
        {
            foreach (var text in texts)
                textQueue.Enqueue(text);
        }

        private void OnEnable() => onItemPickUp.AddListener(QueueItem);
        private void OnDisable() => onItemPickUp.RemoveListener(QueueItem);

        private void QueueItem(string itemName)
        {
            itemQueue.Enqueue(itemName);
            TryDisplayItem();
        }

        private void TryDisplayItem()
        {
            if (itemQueue.Count > 0 && textQueue.Count > 0)
            {
                var text = textQueue.Dequeue();
                text.text = itemQueue.Dequeue();
                var sequence = DOTween.Sequence();
                sequence.Append(text.DOColor(WHITE_COLOR, transitionTime));
                sequence.AppendInterval(displayTime);
                sequence.Append(text.DOColor(INVISIBLE_COLOR, transitionTime));
                sequence.OnComplete(() => QueueText(text));
            }
        }

        private void QueueText(TextMeshProUGUI text)
        {
            text.transform.SetAsLastSibling();
            textQueue.Enqueue(text);
            TryDisplayItem();
        }
    }
}
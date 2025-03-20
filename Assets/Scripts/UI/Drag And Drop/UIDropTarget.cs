using UnityEngine;
using UnityEngine.EventSystems;

namespace Assets.Scripts.UI.DragAndDrop
{
    public abstract class UIDropTarget : MonoBehaviour, IDropHandler
    {
        [SerializeField] protected UltEvents.UltEvent onChanged = new();
        [SerializeField] protected UnityEngine.UI.Image image = null;
        [SerializeField] protected Sprite defaultSprite = null;
        [SerializeField] private UIDropTargetGameEvent onDragEnd = null;

        public void OnDrop(PointerEventData eventData) => onDragEnd.Raise(this);

        public abstract void TryDrop(UIDragSource source);
    }
}
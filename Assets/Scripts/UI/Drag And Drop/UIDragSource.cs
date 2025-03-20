using UnityEngine;
using UnityEngine.EventSystems;
using FMODUnity;

namespace Assets.Scripts.UI.DragAndDrop
{
    public abstract class UIDragSource : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
    {
        [SerializeField] protected UnityEngine.UI.Image image = null;
        [SerializeField] private UIDragSourceGameEvent onStartDrag = null;
        [SerializeField] private GameEvent forceEndDrag = null;

        [SerializeField, Space] private EventReference startDragSound = default;
        [SerializeField] private EventReference endDragSound = default;

        public abstract Sprite Sprite { get; }

        public void OnBeginDrag(PointerEventData eventData)
        {
            if (UnityEngine.InputSystem.Mouse.current.leftButton.ReadValue() == 1)
            {
                onStartDrag.Raise(this);
                RuntimeManager.PlayOneShot(startDragSound, Vector3.zero);
            }
        }

        public void OnDrag(PointerEventData eventData) { }
        
        public void OnEndDrag(PointerEventData eventData)
        {
            forceEndDrag.Raise();
            RuntimeManager.PlayOneShot(endDragSound, Vector3.zero);
        }
    }
}
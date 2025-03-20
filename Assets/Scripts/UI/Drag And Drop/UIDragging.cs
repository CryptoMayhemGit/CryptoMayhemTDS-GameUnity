using UnityEngine;

namespace Assets.Scripts.UI.DragAndDrop
{
    public class UIDragging : MonoBehaviour
    {
        [SerializeField] private RectTransform rectTransform = null;
        [SerializeField] private UnityEngine.UI.Image image = null;

        private UIDragSource draggingFrom;

        private void Update() => CenterToMouse();

        public void StartDrag(UIDragSource source)
        {
            image.sprite = source.Sprite;
            image.rectTransform.sizeDelta = new Vector2(source.Sprite.texture.width, source.Sprite.texture.height);
            draggingFrom = source;
            gameObject.SetActive(true);
            CenterToMouse();
        }

        public void EndDrag(UIDropTarget target)
        {
            target.TryDrop(draggingFrom);
            gameObject.SetActive(false);
        }

        private void CenterToMouse() => rectTransform.position = UnityEngine.InputSystem.Mouse.current.position.ReadValue();
    }
}
using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIWindow : MonoBehaviour
    {
        [SerializeField] private UIWindowList activeUIWindowList = null;
        [SerializeField] private UltEvents.UltEvent onDisable = new();

        private void OnEnable()
        {
            activeUIWindowList.Add(this);
        }

        private void OnDisable()
        {
            activeUIWindowList.Remove(this);
        }

        public void Enable()
        {
            gameObject.SetActive(true);
        }

        public void Disable()
        {
            onDisable.Invoke();
            gameObject.SetActive(false);
        }
    }
}
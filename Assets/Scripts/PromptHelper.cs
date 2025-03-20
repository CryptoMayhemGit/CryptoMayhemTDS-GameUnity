using UltEvents;
using UnityEngine;

namespace Assets.Scripts
{
    public class PromptHelper : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.Event.String_Action_ActionGameEvent showPrompt = null;
        [SerializeField] private string text = "";
        [SerializeField] private UltEvent onConfirm = new();
        [SerializeField] private UltEvent onCancel = new();

        public void ShowPrompt() => showPrompt.Raise(text, Confirm, Cancel);

        private void Confirm() => onConfirm.Invoke();
        private void Cancel() => onCancel.Invoke();
    }
}
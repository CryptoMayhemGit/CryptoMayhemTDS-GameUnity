using System;
using UnityEngine.InputSystem;

namespace Assets.Scripts.Input
{
    public class InputEvent
    {
        private InputActionReference inputAction;

        private event Action onStarted;
        private event Action onPerformed;
        private event Action onCanceled;

        public InputEvent(InputActionReference inputAction, Action onStarted, Action onPerformed, Action onCanceled)
        {
            this.inputAction = inputAction;

            this.onStarted = onStarted;
            this.onPerformed = onPerformed;
            this.onCanceled = onCanceled;
        }

        public void Enable()
        {
            inputAction.action.started += InvokeStart;
            inputAction.action.performed += InvokePerform;
            inputAction.action.canceled += InvokeCancel;
        }

        public void Disable()
        {
            inputAction.action.started -= InvokeStart;
            inputAction.action.performed -= InvokePerform;
            inputAction.action.canceled -= InvokeCancel;
        }

        private void InvokeStart(InputAction.CallbackContext ctx) => onStarted?.Invoke();
        private void InvokePerform(InputAction.CallbackContext ctx) => onPerformed?.Invoke();
        private void InvokeCancel(InputAction.CallbackContext ctx) => onCanceled?.Invoke();
    }
}
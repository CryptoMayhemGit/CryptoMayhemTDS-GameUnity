using System;
using UnityEngine.InputSystem;

namespace Assets.Scripts.Input
{
    public abstract class InputTypeEvent<T> where T : struct
    {
        private InputActionReference inputAction;

        private event Action<T> onStarted;
        private event Action<T> onPerformed;
        private event Action<T> onCanceled;

        public InputTypeEvent(InputActionReference inputAction, Action<T> onStarted, Action<T> onPerformed, Action<T> onCanceled)
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

        private void InvokeStart(InputAction.CallbackContext ctx) => onStarted?.Invoke(ctx.ReadValue<T>());
        private void InvokePerform(InputAction.CallbackContext ctx) => onPerformed?.Invoke(ctx.ReadValue<T>());
        private void InvokeCancel(InputAction.CallbackContext ctx) => onCanceled?.Invoke(ctx.ReadValue<T>());
    }
}
using System;
using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.Input
{
    public class InputVector2Event : InputTypeEvent<Vector2>
    {
        public InputVector2Event(InputActionReference inputAction, Action<Vector2> onStarted, Action<Vector2> onPerformed, Action<Vector2> onCanceled)
            : base(inputAction, onStarted, onPerformed, onCanceled)
        {

        }
    }
}
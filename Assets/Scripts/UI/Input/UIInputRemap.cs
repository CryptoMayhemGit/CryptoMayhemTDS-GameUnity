using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.UI.Input
{
    public class UIInputRemap : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.Event.InputActionReference_IntGameEvent startRebind = null;
        [SerializeField] private InputActionReference targetInput = null;
        [SerializeField] private TMPro.TextMeshProUGUI text = null;
#pragma warning disable 0414
        [SerializeField] private int controlIndex = 0;
#pragma warning restore 0414
        [SerializeField] private int bindingIndex = 0;

        public void SendInputToRemapper() => startRebind.Raise(targetInput, bindingIndex);

        public void UpdateInputText()
        {
            text.text = targetInput.action.bindings[bindingIndex].effectivePath == string.Empty ?
                "Unassigned" :
                InputControlPath.ToHumanReadableString(targetInput.action.bindings[bindingIndex].effectivePath,
                                                        InputControlPath.HumanReadableStringOptions.OmitDevice);
        }
    }
}
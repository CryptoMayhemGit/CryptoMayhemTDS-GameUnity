using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.UI
{
    public class UIInventoryTestBindUpdater : MonoBehaviour
    {
        private const int BIND_INDEX = 0;

        [SerializeField] private TextMeshProUGUI technology1Text = null;
        [SerializeField] private TextMeshProUGUI technology2Text = null;
        [SerializeField] private TextMeshProUGUI technology3Text = null;
        [SerializeField] private TextMeshProUGUI technology4Text = null;
        [SerializeField] private TextMeshProUGUI technology5Text = null;

        [SerializeField] private InputActionReference technology1Input = null;
        [SerializeField] private InputActionReference technology2Input = null;
        [SerializeField] private InputActionReference technology3Input = null;
        [SerializeField] private InputActionReference technology4Input = null;
        [SerializeField] private InputActionReference technology5Input = null;

        [SerializeField] private TextMeshProUGUI item1Text = null;
        [SerializeField] private TextMeshProUGUI item2Text = null;
        [SerializeField] private TextMeshProUGUI item3Text = null;

        [SerializeField] private InputActionReference item1Input = null;
        [SerializeField] private InputActionReference item2Input = null;
        [SerializeField] private InputActionReference item3Input = null;

        public void RebuildTextBinds()
        {
            technology1Text.text = GetBindText(technology1Input);
            technology2Text.text = GetBindText(technology2Input);
            technology3Text.text = GetBindText(technology3Input);
            technology4Text.text = GetBindText(technology4Input);
            technology5Text.text = GetBindText(technology5Input);

            item1Text.text = GetBindText(item1Input);
            item2Text.text = GetBindText(item2Input);
            item3Text.text = GetBindText(item3Input);
        }

        private string GetBindText(InputActionReference inputActionReference)
        {
            return (inputActionReference.action.bindings[BIND_INDEX].effectivePath == string.Empty ?
                "Unassigned" :
                InputControlPath.ToHumanReadableString(inputActionReference.action.bindings[BIND_INDEX].effectivePath,
                                                        InputControlPath.HumanReadableStringOptions.OmitDevice))
                                                        .Substring(0, 1);
        }
    }
}
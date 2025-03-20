using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.Input
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Manager/Input UI")]
    public class InputUIManager : Manager.Manager
    {
        private const int PLAYER_ACTION_MAP_INDEX = 0;

        [SerializeField] private InputActionAsset input = null;
        [SerializeField] private InputActionReference esacpe = null;
        [SerializeField] private SOArchitecture.UIWindowList uiWindowList = null;
        [SerializeField] private GameEvent openMenuEvent = null;

        private InputEvent escapeInput;

        public override void Init()
        {
            escapeInput = new InputEvent(esacpe, null, CloseLastUIWindowOrOpenMenu, null);
        }

        public override void Enable()
        {
            uiWindowList.AddOnChangeListener(ManagePlayerInput);

            escapeInput.Enable();
        }

        public override void Disable()
        {
            uiWindowList.RemoveOnChangeListener(ManagePlayerInput);

            escapeInput.Disable();
        }

        private void ManagePlayerInput()
        {
            if (uiWindowList.Count != 0)
                input.actionMaps[PLAYER_ACTION_MAP_INDEX].Disable();
            else
                input.actionMaps[PLAYER_ACTION_MAP_INDEX].Enable();
        }

        private void CloseLastUIWindowOrOpenMenu()
        {
            if (uiWindowList.Count == 0)
                openMenuEvent.Raise();
            else
                uiWindowList.Value[^1].Disable();
        }
    }
}
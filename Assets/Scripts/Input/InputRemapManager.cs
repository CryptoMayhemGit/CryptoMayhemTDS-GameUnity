using UnityEngine;
using UnityEngine.InputSystem;

namespace Assets.Scripts.Input
{
    public class InputRemapManager : Manager.Manager
    {
        private const string KEY_SAVE = "Player_Binds";

        [SerializeField] private InputActionAsset input = null;
        [SerializeField] private SOArchitecture.Event.InputActionReference_IntGameEvent startRebind = null;
        [SerializeField] private GameEvent bindChanged = null;
        [SerializeField] private GameEvent cancelRebind = null;

        private InputActionRebindingExtensions.RebindingOperation rebindingOperation;

        public override void Init()
        {
            var rebinds = PlayerPrefs.GetString(KEY_SAVE, "");

            if (!string.IsNullOrEmpty(rebinds))
                input.LoadBindingOverridesFromJson(rebinds);
        }

        public override void Enable() => startRebind.AddListener(StartRebinding);
        public override void Disable() => startRebind.RemoveListener(StartRebinding);

        public void ResetInputsToDefault()
        {
            input.RemoveAllBindingOverrides();
            bindChanged.Raise();
            SaveBindings();
        }

        public void CancelCurrentRebinding()
        {
            rebindingOperation.Cancel();
        }

        private void StartRebinding(InputActionReference input, int bindingIndex)
        {
            rebindingOperation = input.action.PerformInteractiveRebinding(bindingIndex)
                .OnMatchWaitForAnother(0.1f)
                .WithControlsExcluding("Mouse")
                .WithCancelingThrough("<keyboard>/escape")
                .OnComplete(operation =>
                {
                    MakeNewInputUnique(input, bindingIndex);
                    bindChanged.Raise();
                    DisposeRebindingOperation();
                    SaveBindings();
                })
                .OnCancel(operation =>
                {
                    cancelRebind.Raise();
                    DisposeRebindingOperation();
                    SaveBindings();
                })
                .Start();
        }

        private void MakeNewInputUnique(InputActionReference input, int bindingIndex)
        {
            foreach (var actionMap in this.input.actionMaps)
                foreach (var action in actionMap.actions)
                    for (int i = 0; i < action.bindings.Count; i++)
                    {
                        if (!action.bindings[i].id.Equals(input.action.bindings[bindingIndex].id)
                            && action.bindings[i].effectivePath.Equals(input.action.bindings[bindingIndex].effectivePath))
                        {
                            action.ApplyBindingOverride(i, string.Empty);
                            return;
                        }
                    }
        }

        private void SaveBindings() => PlayerPrefs.SetString(KEY_SAVE, input.SaveBindingOverridesAsJson());

        private void DisposeRebindingOperation()
        {
            rebindingOperation.Dispose();
            rebindingOperation = null;
        }
    }
}
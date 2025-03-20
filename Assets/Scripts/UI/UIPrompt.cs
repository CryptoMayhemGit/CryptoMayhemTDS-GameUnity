using System;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIPrompt : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.Event.String_Action_ActionGameEvent show = null;
        [SerializeField] private GameObject menu = null;
        [SerializeField] private TMPro.TextMeshProUGUI text = null;
        [SerializeField] private Button confirm = null;
        [SerializeField] private Button cancel = null;

        private void OnEnable() => show.AddListener(Show);
        private void OnDisable() => show.RemoveListener(Show);

        private void Show(string text, Action OnConfirm, Action OnCancel)
        {
            this.text.text = text;

            confirm.onClick.RemoveAllListeners();

            if (OnConfirm != null)
                confirm.onClick.AddListener(() => OnConfirm.Invoke());

            cancel.onClick.RemoveAllListeners();

            if (OnCancel != null)
                cancel.onClick.AddListener(() => OnCancel.Invoke());

            menu.SetActive(true);
        }
    }
}
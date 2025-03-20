using System;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIButtonHandler : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler,
        IPointerUpHandler
    {
        private enum State
        {
            Default,
            Highlighted,
            Pressed,
            Disabled
        }

        [SerializeField] private Button button = null;
        [SerializeField] private TextMeshProUGUI buttonText = null;
        [SerializeField] private Color defaultColor = new();
        [SerializeField] private Color highlightedColor = new();
        [SerializeField] private Color pressedColor = new();
        [SerializeField] private Color disabledColor = new();

        private State targetState;

        private bool shouldHighlight;
        private bool shouldPress;

        private void OnEnable()
        {
            shouldHighlight = false;
            shouldPress = false;
            EvaluateState();
        }

        public Button Button => button;
        public void ForceUpdateState() => EvaluateState();

        public void OnPointerDown(PointerEventData eventData)
        {
            shouldPress = true;
            EvaluateState();
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            shouldHighlight = true;
            EvaluateState();
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            shouldHighlight = false;
            EvaluateState();
        }

        public void OnPointerUp(PointerEventData eventData)
        {
            shouldPress = false;
            EvaluateState();
        }

        private void EvaluateState()
        {
            targetState = State.Default;

            if (!button.interactable)
                targetState = State.Disabled;
            else if (shouldPress)
                targetState = State.Pressed;
            else if (shouldHighlight)
                targetState = State.Highlighted;
           

            switch (targetState)
            {
                case State.Default:
                    buttonText.color = defaultColor;
                    break;
                case State.Disabled:
                    buttonText.color = disabledColor;
                    break;
                case State.Pressed:
                    buttonText.color = pressedColor;
                    break;
                case State.Highlighted:
                    buttonText.color = highlightedColor;
                    break;
            }
        }
    }
}
using System;
using UltEvents;
using UnityEngine;

namespace Assets.Scripts.Manager
{
    public class GameManager : MonoBehaviour
    {
        [SerializeField] private System.Collections.Generic.List<Manager> managers = new();
        [SerializeField] private UltEvent onInit = new();
        [SerializeField] private UltEvent onEnable = new();
        [SerializeField] private UltEvent onDisable = new();

        public event Action OnUpdate;
        public event Action OnFixedUpdate;
        public event Action OnLateUpdate;

        private void Awake()
        {
            onInit.Invoke();

            for (int i = 0; i < managers.Count; i++)
                managers[i].Init();
        }

        private void Start()
        {
            for (int i = 0; i < managers.Count; i++)
                managers[i].Enable();

            onEnable.Invoke();
        }

        private void OnDestroy()
        {
            for (int i = 0; i < managers.Count; i++)
                managers[i].Disable();

            onDisable.Invoke();
        }

        private void Update()
        {
            for (int i = 0; i < managers.Count; i++)
                managers[i].OnUpdate();

            OnUpdate?.Invoke();
        }

        private void FixedUpdate() => OnFixedUpdate?.Invoke();

        private void LateUpdate() => OnLateUpdate?.Invoke();
    }
}
using Sirenix.OdinInspector;
using System;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Profiling;

namespace Assets.Scripts.Input
{
    public class PlayerInput : CharacterComponent
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private InputActionReference move = null;
        [SerializeField] private InputActionReference attack = null;
        [SerializeField] private InputActionReference secondAttack = null;
        [SerializeField] private InputActionReference reloadMainWeapon = null;
        [SerializeField] private InputActionReference reloadSecondaryWeapon = null;
        [SerializeField] private InputActionReference item1 = null;
        [SerializeField] private InputActionReference item2 = null;
        [SerializeField] private InputActionReference item3 = null;

        [SerializeField] private InputActionReference technology1 = null;
        [SerializeField] private InputActionReference technology2 = null;
        [SerializeField] private InputActionReference technology3 = null;
        [SerializeField] private InputActionReference technology4 = null;
        [SerializeField] private InputActionReference technology5 = null;
        [SerializeField] private InputActionReference interaction = null;

        [ShowInInspector, ReadOnly] public Vector2 MovementDirection { set; get; }
        [ShowInInspector, ReadOnly] public Vector3 CannonTarget { set; get; }

        private InputVector2Event moveInput;
        private InputEvent attackInput;
        private InputEvent secondAttackInput;
        private InputEvent reloadMainWeaponInput;
        private InputEvent reloadSecondaryWeaponInput;
        private InputEvent item1Input;
        private InputEvent item2Input;
        private InputEvent item3Input;
        private InputEvent technology1Input;
        private InputEvent technology2Input;
        private InputEvent technology3Input;
        private InputEvent technology4Input;
        private InputEvent technology5Input;
        private InputEvent interactionInput;

        public event Action OnStartBasicAttack;
        public event Action OnEndBasicAttack;
        public event Action OnStartSecondaryAttack;
        public event Action OnEndSecondaryAttack;
        public event Action OnReloadMainWeapon;
        public event Action OnReloadSecondaryWeapon;
        public event Action<int> OnUseItem;
        public event Action<int> OnUseTechnology;
        public event Action OnInteraction;

        public event Action OnAnyInput;

        private Plane plane = new Plane(Vector3.up, 0);

        public override void OnSpawn()
        {
            base.OnSpawn();

            moveInput = new InputVector2Event(move, (x) => MovementDirection = x, (x) => MovementDirection = x, (x) => MovementDirection = x);

            attackInput = new InputEvent(attack, () => OnStartBasicAttack?.Invoke(), null, () => OnEndBasicAttack?.Invoke());
            secondAttackInput = new InputEvent(secondAttack, () => OnStartSecondaryAttack?.Invoke(), null, () => OnEndSecondaryAttack?.Invoke());
            reloadMainWeaponInput = new InputEvent(reloadMainWeapon, null, () => OnReloadMainWeapon?.Invoke(), null);
            reloadSecondaryWeaponInput = new InputEvent(reloadSecondaryWeapon, null, () => OnReloadSecondaryWeapon?.Invoke(), null);

            item1Input = new InputEvent(item1, null, () => OnUseItem?.Invoke(0), null);
            item2Input = new InputEvent(item2, null, () => OnUseItem?.Invoke(1), null);
            item3Input = new InputEvent(item3, null, () => OnUseItem?.Invoke(2), null);

            technology1Input = new InputEvent(technology1, null, () => OnUseTechnology?.Invoke(0), null);
            technology2Input = new InputEvent(technology2, null, () => OnUseTechnology?.Invoke(1), null);
            technology3Input = new InputEvent(technology3, null, () => OnUseTechnology?.Invoke(2), null);
            technology4Input = new InputEvent(technology4, null, () => OnUseTechnology?.Invoke(3), null);
            technology5Input = new InputEvent(technology5, null, () => OnUseTechnology?.Invoke(4), null);

            interactionInput = new InputEvent(interaction, null, () => OnInteraction?.Invoke(), null);
        }

        private void OnEnable()
        {
            moveInput.Enable();

            attackInput.Enable();
            secondAttackInput.Enable();
            reloadMainWeaponInput.Enable();
            reloadSecondaryWeaponInput.Enable();

            item1Input.Enable();
            item2Input.Enable();
            item3Input.Enable();

            technology1Input.Enable();
            technology2Input.Enable();
            technology3Input.Enable();
            technology4Input.Enable();
            technology5Input.Enable();

            interactionInput.Enable();

            gameManager.Value.OnUpdate += GetMouseWorldPosition;

            OnStartBasicAttack += AnyInput;
            OnEndBasicAttack += AnyInput;
            OnStartSecondaryAttack += AnyInput;
            OnEndSecondaryAttack += AnyInput;
            OnReloadMainWeapon += AnyInput;
            OnReloadSecondaryWeapon += AnyInput;
            OnUseItem += AnyIntInput;
            OnUseTechnology += AnyIntInput;
            OnInteraction += AnyInput;
        }

        private void OnDisable()
        {
            moveInput.Disable();

            attackInput.Disable();
            secondAttackInput.Disable();
            reloadMainWeaponInput.Disable();
            reloadSecondaryWeaponInput.Disable();

            item1Input.Disable();
            item2Input.Disable();
            item3Input.Disable();

            technology1Input.Disable();
            technology2Input.Disable();
            technology3Input.Disable();
            technology4Input.Disable();
            technology5Input.Disable();

            interactionInput.Disable();

            gameManager.Value.OnUpdate -= GetMouseWorldPosition;

            OnStartBasicAttack -= AnyInput;
            OnEndBasicAttack -= AnyInput;
            OnStartSecondaryAttack -= AnyInput;
            OnEndSecondaryAttack -= AnyInput;
            OnReloadMainWeapon -= AnyInput; 
            OnReloadSecondaryWeapon -= AnyInput;
            OnUseItem -= AnyIntInput;
            OnUseTechnology -= AnyIntInput;
            OnInteraction -= AnyInput;
        }

        private void GetMouseWorldPosition()
        {
            Profiler.BeginSample("PlayerInput.GetMouseWorldPosition");
            Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());
            float distance = 0;

            if (plane.Raycast(ray, out distance))
                CannonTarget = ray.GetPoint(distance);
            Profiler.EndSample();
        }

        private void AnyInput() => OnAnyInput?.Invoke();

        private void AnyIntInput(int i) => AnyInput();
    }
}
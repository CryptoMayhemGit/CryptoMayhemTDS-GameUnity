using UnityEngine;

namespace Assets.Scripts.Containers
{
    public class PlayerContainer : CharacterContainer
    {
        [field: SerializeField] public Inventory.PlayerInventory Inventory { private set; get; } = null;
        [field: SerializeField] public Inventory.PlayerItems Items { private set; get; } = null;
        [field: SerializeField] public Skills.PlayerPassives Passives { private set; get; } = null;
        [field: SerializeField] public Input.PlayerInput Input { private set; get; } = null;
        [field: SerializeField] public Movement.PlayerMovement Movement { private set; get; } = null;
        [field: SerializeField] public StateMachine.PlayerStateMachine StateMachine { private set; get; } = null;
        [field: SerializeField] public Cannon.PlayerCannonRotate CannonRotate { private set; get; } = null;
        [field: SerializeField] public Cannon.PlayerAttack Attack { private set; get; } = null;
        [field: SerializeField] public Loot.PlayerBackpack Backpack { private set; get; } = null;
        [field: SerializeField] public Fuel.PlayerFuel Fuel { private set; get; } = null;
        [field: SerializeField] public Interactions.PlayerInteractions Interactions { private set; get; } = null;

        [field: SerializeField]
        public Animations.PlayerAnimationController AnimationController { private set; get; } = null;

        [field: SerializeField] public TrailRenderer Trail { private set; get; } = null;
        [field: SerializeField] public GameObject Model { private set; get; } = null;

        [SerializeReference] public GameEvent OnPlayerSpawn;
        [SerializeReference] public GameEvent OnPlayerDespawn;

        public override void Spawn()
        {
            base.Spawn();

            Input.OnSpawn();
            StateMachine.OnSpawn();
            Attack.OnSpawn();
            Items.OnSpawn();
            Passives.OnSpawn();
            Movement.OnSpawn();
            CannonRotate.OnSpawn();
            Backpack.OnSpawn();
            Fuel.OnSpawn();
            Interactions.OnSpawn();
            AnimationController.OnSpawn();

            if (OnPlayerSpawn != null)
                OnPlayerSpawn.Raise();
        }

        public override void Despawn()
        {
            base.Despawn();

            Input.OnDespawn();
            StateMachine.OnDespawn();
            Attack.OnDespawn();
            Items.OnDespawn();
            Passives.OnDespawn();
            Movement.OnDespawn();
            CannonRotate.OnDespawn();
            Backpack.OnDespawn();
            Fuel.OnDespawn();
            Interactions.OnDespawn();
            AnimationController.OnDespawn();

            if (OnPlayerDespawn != null)
                OnPlayerDespawn.Raise();
        }
    }
}
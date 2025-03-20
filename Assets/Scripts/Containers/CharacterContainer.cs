using UnityEngine;

namespace Assets.Scripts.Containers
{
    public class CharacterContainer : MonoBehaviour
    {
        [SerializeField] private UltEvents.UltEvent onSpawn = new();
        [SerializeField] private UltEvents.UltEvent onDespawn = new();
        public System.Action OnDespawnAction;

        [field: SerializeField] public Vector3 Size { private set; get; } = Vector3.one; //TODO testowo
        [field: SerializeField] public Transform Transform { private set; get; } = null;
        [field: SerializeField] public Rigidbody Rigidbody { private set; get; } = null;
        [field: SerializeField] public Stats.CharacterStats Stats { private set; get; } = null;
        [field: SerializeField] public Damage.CharacterHealth Health { private set; get; } = null;
        [field: SerializeField] public Cooldowns.CharacterCooldowns Cooldowns { private set; get; } = null;
        [field: SerializeField] public Effects.CharacterEffects Effects { private set; get; } = null;
        [field: SerializeField] public Skills.CharacterSkills Skills { private set; get; } = null;
        [field: SerializeField] public Sound.CharacterSounds Sounds { private set; get; } = null;
        [field: SerializeField] public Transform AttackPivot { private set; get; } = null;
        [field: SerializeField] public Movement.Dash.DashCollisionDetector DashCollisionDetector { private set; get; } = null;
        [field: SerializeField] public Shield.CharacterShieldRegeneration ShieldRegeneration { private set; get; } = null;

        private int blockMovementCounter;
        private int blockAttackCounter;

        public void AddBlockMovementFactor() => ++blockMovementCounter;
        public void RemoveBlockMovementFactor() => --blockMovementCounter;
        public bool CanMove() => blockMovementCounter == 0;

        public void AddBlockAttackFactor() => ++blockAttackCounter;
        public void RemoveBlockAttackFactor() => --blockAttackCounter;
        public bool CanAttack() => blockAttackCounter == 0;

        public virtual void Spawn()
        {
            Stats.OnSpawn();
            Health.OnSpawn();
            Cooldowns.OnSpawn();
            Effects.OnSpawn();
            Skills.OnSpawn();
            ShieldRegeneration?.OnSpawn();
            Sounds.OnSpawn();

            onSpawn?.Invoke();
        }

        public virtual void Despawn()
        {
            onDespawn?.Invoke();
            OnDespawnAction?.Invoke();

            Stats.OnDespawn();
            Health.OnDespawn();
            Cooldowns.OnDespawn();
            Effects.OnDespawn();
            Skills.OnDespawn();
            ShieldRegeneration?.OnDespawn();
            Sounds.OnDespawn();
        }
    }
}
using Assets.Scripts.SOArchitecture;
using Assets.Scripts.Stats;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Loot
{
    public class PlayerBackpack : CharacterComponent
    {
        [SerializeField] private GameManagerVariable gameManager = null;
        [SerializeField] private FloatVariable mothershipToAddOnLevelEndSO = null;
        [SerializeField] private FloatVariable mothershipBiomass = null;
        [SerializeField] private CachedDynamicStat backpackBiomass = new();

        [field: SerializeField, Min(0.1f)] public float BackpackReleaseCooldown { get; private set; } = 90f;
        [field: SerializeField, Min(1f)] public float MaxBiomassPerLevel { get; private set; } = 500f;
        [field: SerializeField] public UltEvents.UltEvent OnSendedMothershipBiomass { get; private set; } = new();

        [ShowInInspector, ReadOnly] private float biomassToAddOnLevelEnd = 0f;
        private float timer;

        public override void OnSpawn()
        {
            base.OnSpawn();
            timer = 0f;
            ResetBackpack();
            gameManager.Value.OnUpdate += CountTick;
        }

        public override void OnDespawn()
        {
            base.OnSpawn();
            if (biomassToAddOnLevelEnd < MaxBiomassPerLevel)
                gameManager.Value.OnUpdate -= CountTick;
        }

        private void CountTick()
        {
            if ((timer += Time.deltaTime) >= BackpackReleaseCooldown)
            {
                AddBackpackValueToTemp();
                timer = 0f;
            }
        }

        public void ResetBackpack() => backpackBiomass.Get().ModifyDynamicValue(-Mathf.Infinity);

        public void AddBackpackValueToTemp()
        {
            biomassToAddOnLevelEnd += backpackBiomass.Get().DynamicValue;
            ResetBackpack();

            if (biomassToAddOnLevelEnd >= MaxBiomassPerLevel)
            {
                gameManager.Value.OnUpdate -= CountTick;
                biomassToAddOnLevelEnd = MaxBiomassPerLevel;
                OnSendedMothershipBiomass?.Invoke();
            }
        }

        public void AddTempValueToMothership()
        {
            mothershipToAddOnLevelEndSO.Value = Mathf.RoundToInt(biomassToAddOnLevelEnd);
            mothershipBiomass.Value += mothershipToAddOnLevelEndSO.Value;
        }
    }
}
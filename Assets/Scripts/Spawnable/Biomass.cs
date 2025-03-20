using Assets.Scripts.Pooling;
using Assets.Scripts.Stats;
using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using UnityEngine;
using Sirenix.OdinInspector;
using FMODUnity;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class Biomass : SpawnableItem
    {
        public enum EmiterState 
        { 
            Gurgle = 0, 
            Crawl = 1,
            Merge = 2, 
            Flush = 3
        }

        private const float Max_Size = 500f;

        [SerializeField] private GameManagerVariable gameManager = null;
        [SerializeField] private SphereCollider sphereCollider = null;
        [SerializeField] private EnemyContainerPool biomassMonster = null;
        [SerializeField] private StatType biomass = null;
        [SerializeField] private StatType biomassBackpack = null;
        [SerializeField] private StatType biomassAbsorbtionRate = null;
        [SerializeField] private StatType biomassAbsorbtionModifier = null;
        [SerializeField] private float growTimeInterval = 5f;
        [SerializeField] private float growSpeedMultiplier = 2.5f;
        [SerializeField] private float moveSpeed = 0.5f;
        [SerializeField] private AnimationCurve sizeToScale = AnimationCurve.Linear(0, 1f, Max_Size, 8f);
        [SerializeField] private AnimationCurve growStates = new AnimationCurve(new Keyframe(0, 20f), new Keyframe(99f, 20f), new Keyframe(100f, 50f), new Keyframe(299f, 50f), new Keyframe(300f, 100f), new Keyframe(Max_Size, 100f));
        [SerializeField] private StudioEventEmitter bioEmitter = null;

        [ShowInInspector, ReadOnly] private Biomass neighbor = null;
        [ShowInInspector, ReadOnly] private float currentSize = 20f;
        [ShowInInspector, ReadOnly] private float targetSize = 20f;
        [ShowInInspector, ReadOnly] private bool isAbsorbed = false;

        private float currentTime = 0;
        private PlayerContainer player;

        public override void Init(CharacterContainer owner, object initialBiomass)
        {
            ResetBiomassStats((float)initialBiomass);
            sphereCollider.enabled = true;
            SearchForNeighbors();
            gameManager.Value.OnUpdate += UpdateGrowState;
        }

        public void SetEmitterParametr(EmiterState state)
        {
            bioEmitter.SetParameter("biomassState", (int)state);
        }

        private void OnTriggerEnter(Collider other)
        {
            if (player == null)
            {
                other.TryGetComponent<PlayerContainer>(out player);
                SetEmitterParametr(EmiterState.Flush);
            }
        }

        private void OnTriggerExit(Collider other)
        {
            if (other.TryGetComponent<PlayerContainer>(out PlayerContainer exitPlayer))
                if (player == exitPlayer)
                {
                    player = null;
                    SetEmitterParametr(EmiterState.Gurgle);
                }
        }

        private void UpdateGrowState()
        {
            Profiler.BeginSample("Biomass.UpdateGrowState");
            SmoothGrowBiomass();

            if (player != null)
                AbsorbBiomassByPlayer();

            if (neighbor != null)
                MoveBiomassToNeigbor();

            if ((currentTime += Time.deltaTime) < growTimeInterval || currentSize >= Max_Size)
            {
                Profiler.EndSample();
                return;
            }

            currentTime = 0;

            if (!isAbsorbed)
                AddBiomassSize(growStates.Evaluate(currentSize));

            if (neighbor == null)
                SearchForNeighbors();
            Profiler.EndSample();
        }

        private void SearchForNeighbors()
        {
            Biomass selected;
            foreach (Collider collider in Physics.OverlapSphere(Transform.position, Transform.localScale.x * sphereCollider.radius, 1 << Transform.gameObject.layer))
            {
                if (collider.transform != Transform)
                {
                    selected = collider.GetComponent<Biomass>();
                    if (selected.neighbor == null && !selected.isAbsorbed)
                    {
                        neighbor = selected;
                        selected.neighbor = this;


                        if (neighbor.targetSize > targetSize)
                        {
                            neighbor.SetEmitterParametr(EmiterState.Crawl);
                            SetEmitterParametr(EmiterState.Merge);

                            neighbor.AddBiomassSize(targetSize);
                            RemoveBiomassSize(targetSize);
                            isAbsorbed = true;
                            neighbor.isAbsorbed = false;
                        }
                        else
                        {
                            neighbor.SetEmitterParametr(EmiterState.Merge);
                            SetEmitterParametr(EmiterState.Crawl);

                            AddBiomassSize(neighbor.targetSize);
                            neighbor.RemoveBiomassSize(neighbor.targetSize);
                            isAbsorbed = false;
                            neighbor.isAbsorbed = true;
                        }
                    }
                }
            }
        }

        private void MoveBiomassToNeigbor()
        {
            if (isAbsorbed)
                return;

            Vector3 direction = (neighbor.Transform.position - Transform.position).normalized;
            Transform.position += direction * moveSpeed * Time.deltaTime;
        }

        private void AbsorbBiomassByPlayer()
        {
            if (targetSize == 0)
                return;

            DynamicStat biomassValue = player.Stats.GetDynamicStat(biomass);
            DynamicStat backpackValue = player.Stats.GetDynamicStat(biomassBackpack);
            DynamicStat absorbRate = player.Stats.GetDynamicStat(biomassAbsorbtionRate);
            Stat absorbModifier = player.Stats.GetStat(biomassAbsorbtionModifier);
            float biomassToAbsorb = absorbRate.DynamicValue * absorbModifier.Value * Time.deltaTime;
            biomassToAbsorb = Mathf.Min(targetSize, biomassToAbsorb);

            if (biomassValue.Value - biomassValue.DynamicValue >= biomassToAbsorb)
            {
                biomassValue.ModifyDynamicValue(biomassToAbsorb);
            }
            else if (biomassValue.Value - biomassValue.DynamicValue < biomassToAbsorb && biomassValue.Value - biomassValue.DynamicValue > 0)
            {
                biomassValue.ModifyDynamicValue(biomassValue.Value - biomassValue.DynamicValue);
                backpackValue.ModifyDynamicValue(biomassToAbsorb - (biomassValue.Value - biomassValue.DynamicValue));
            }
            else
            {
                backpackValue.ModifyDynamicValue(biomassToAbsorb);
            }

            RemoveBiomassSize(biomassToAbsorb);
        }

        private void AddBiomassSize(float value)
        {
            targetSize += value;
            targetSize = Mathf.Clamp(targetSize, 0, Max_Size);
        }

        private void RemoveBiomassSize(float value)
        {
            targetSize -= value;
            targetSize = Mathf.Clamp(targetSize, 0, Max_Size);
        }

        private void SmoothGrowBiomass()
        {
            if (currentSize <= 1f)
                ReturnBiomassToPool();

            if (currentSize < targetSize)
                currentSize += Mathf.Max(Mathf.Abs(targetSize - currentSize) * growSpeedMultiplier, growSpeedMultiplier * growSpeedMultiplier) * Time.deltaTime;
            else if (currentSize > targetSize)
                currentSize -= Mathf.Max(Mathf.Abs(targetSize - currentSize) * growSpeedMultiplier, growSpeedMultiplier * growSpeedMultiplier) * Time.deltaTime;

            currentSize = Mathf.Clamp(currentSize, 0, Max_Size);
            Transform.localScale = Vector3.one * sizeToScale.Evaluate(currentSize);

            if (currentSize >= Max_Size - 1f)
                SpawnBiomassMonster();
        }

        private void SpawnBiomassMonster()
        {
            EnemyContainer monster = biomassMonster.GetFromPool();
            monster.Transform.SetPositionAndRotation(Transform.position, Transform.rotation);
            monster.Spawn();

            targetSize = 0;
            isAbsorbed = true;
        }

        private void ResetBiomassStats(float initialBiomass)
        {
            FMODUnity.RuntimeManager.PlayOneShot(spawnSound, Transform.position);
            SetEmitterParametr(EmiterState.Gurgle);
            bioEmitter.Play();
            
            neighbor = null;
            player = null;
            currentSize = initialBiomass;
            targetSize = initialBiomass;
            transform.localScale = Vector3.one * sizeToScale.Evaluate(currentSize);
            isAbsorbed = false;
        }

        public void ReturnBiomassToPool()
        {
            gameManager.Value.OnUpdate -= UpdateGrowState;
            sphereCollider.enabled = false;
            currentTime = 0;
            bioEmitter.Stop();

            if (neighbor != null)
            {
                neighbor.neighbor = null;
                neighbor.isAbsorbed = false;
                neighbor.SetEmitterParametr(EmiterState.Gurgle);
            }

            neighbor = null;
            Pool.ReturnToPool(this);
        }
    }
}
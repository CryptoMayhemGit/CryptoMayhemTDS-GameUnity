using System.Collections.Generic;
using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class Decoy : SpawnableItem
    {
        [SerializeField] protected SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] protected CharacterContainer character = null;
        [SerializeField] protected SphereCollider sphereCollider = null;
        [SerializeField, Min(0.1f)] protected float lifeTime = 5f;
        [SerializeField, Min(0.1f)] protected float decoyRadius = 100f;

        protected float lifeTimer;
        protected List<EnemyContainer> affectedEnemies = new();

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            character.Spawn();
            lifeTimer = lifeTime;
            gameManager.Value.OnUpdate += UpdateTick;
            FMODUnity.RuntimeManager.PlayOneShot(spawnSound, character.Transform.position);
        }

#if UNITY_EDITOR
        private void OnValidate() => sphereCollider.radius = decoyRadius;
#endif

        protected virtual void UpdateTick()
        {
            Profiler.BeginSample("Decoy.UpdateTick");
            if ((lifeTimer -= Time.deltaTime) <= 0f)
                ReturnToPool();
            Profiler.EndSample();
        }

        public virtual void ReturnToPool()
        {
            gameManager.Value.OnUpdate -= UpdateTick;
            Pool.ReturnToPool(this);

            foreach (EnemyContainer enemy in affectedEnemies)
                if (enemy.TargetSearcher.ClosestTarget == character)
                    enemy.TargetSearcher.ClosestTarget = null;

            affectedEnemies.Clear();
        }

        public void OnEnemyEnter(Collider other)
        {
            EnemyContainer current = other.GetComponent<EnemyContainer>();
            current.TargetSearcher.ClosestTarget = character;
            affectedEnemies.Add(current);
        }

        public void OnEnemyExit(Collider other)
        {
            EnemyContainer current = other.GetComponent<EnemyContainer>();
            current.TargetSearcher.ClosestTarget = null;
            affectedEnemies.Remove(current);
        }
    }
}
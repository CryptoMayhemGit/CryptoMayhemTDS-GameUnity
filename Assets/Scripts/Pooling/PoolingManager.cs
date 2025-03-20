using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Pooling
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Manager/Pooling")]
    public class PoolingManager : Manager.Manager
    {
        [SerializeField] private List<Pool<Containers.EnemyContainer>> enemies = new();
        [SerializeField] private List<Pool<Weapons.Projectiles.Projectile>> projectiles = new();
        [SerializeField] private List<Pool<Weapons.ArtilleryImpacts.ArtilleryImpact>> artilleryImpacts = new();
        [SerializeField] private List<Pool<Spawnable.SpawnableItem>> spawnables = new();
        [SerializeField] private List<Pool<Transform>> transforms = new();
        [SerializeField] private List<Pool<VisualEffect.VisualEffectHolder>> visualEffects = new();
        [SerializeField] private List<Pool<Spawnable.Visual>> visuals = new();

        public override void Init()
        {
            Transform poolsHolder = new GameObject("---POOLS---").transform;

            foreach (var item in enemies)
                CreatePools(item, poolsHolder);

            foreach (var item in projectiles)
                CreatePools(item, poolsHolder);

            foreach (var item in artilleryImpacts)
                CreatePools(item, poolsHolder);

            foreach (var item in spawnables)
                CreatePools(item, poolsHolder);

            foreach (var item in transforms)
                CreatePools(item, poolsHolder);

            foreach (var item in visualEffects)
                CreatePools(item, poolsHolder);

            foreach (var item in visuals)
                CreatePools(item, poolsHolder);
        }

        private void CreatePools<T>(Pool<T> pool, Transform poolsHolder) where T : Component
        {
            Transform parent = new GameObject(pool.name).transform;
            parent.parent = poolsHolder;

            pool.Init(parent);
        }
    }
}
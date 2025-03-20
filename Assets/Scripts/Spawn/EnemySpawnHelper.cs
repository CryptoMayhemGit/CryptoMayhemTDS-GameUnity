using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.Spawn
{
    public static class EnemySpawnHelper
    {
        public static void SpawnEnemy(Pooling.EnemyContainerPool pool, Transform transform, Vector3 offset)
        {
            var enemy = pool.GetFromPool();
            enemy.Transform.SetPositionAndRotation(transform.position + offset, transform.rotation);
            enemy.Spawn();
        }

        public static void SpawnSpawnableItem(Pooling.SpawnableItemPool pool, CharacterContainer character)
        {
            var item = pool.GetFromPool();
            item.Transform.SetPositionAndRotation(character.Transform.position, character.Transform.rotation);
            item.Init(character);
        }
    }
}
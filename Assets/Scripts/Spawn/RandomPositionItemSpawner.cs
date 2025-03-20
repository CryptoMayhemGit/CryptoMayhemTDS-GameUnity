using Sirenix.OdinInspector;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Assets.Scripts.Spawn
{
    public class RandomPositionItemSpawner : MonoBehaviour
    {
        //[System.Serializable]
        //private class SpawnerItemData
        //{
        //    [field: SerializeField] public Pool PoolType { private set; get; } = null;
        //    [field: SerializeField] public int SpawnAmount { private set; get; } = 1;
        //    [field: SerializeField, Min(1f), MaxValue(10f)] public float Radius { private set; get; } = 1f;
        //}

        //private readonly float MAX_RADIUS = 10f;
        //private readonly float OUTER_WALL_WIDTH = 5f;

        //[SerializeField] private Vector2 mapSize = new(400f, 400f);
        //[SerializeField] private int spawnsFailedToExit = 10;
        //[SerializeField] private LayerMask layersTaken = default;
        //[SerializeField] private List<SpawnerItemData> itemsToSpawn = new();
        //[SerializeField] private List<SpawnerItemData> enemiesToSpawn = new();

        //private Vector3 spawnZoneBounds;
        //private Vector3Int gridBounds;
        //private Vector3 offset;

        //private float[] grid;

        //private void Awake()
        //{
        //    GenerateGrid();
        //    CheckWalls();
        //}

        //private void GenerateGrid()
        //{
        //    spawnZoneBounds = new Vector3(mapSize.x, 0f, mapSize.y) - new Vector3(OUTER_WALL_WIDTH, 0f, OUTER_WALL_WIDTH);
        //    gridBounds = Vector3Int.FloorToInt(spawnZoneBounds);
        //    offset = new Vector3(mapSize.x, 0f, mapSize.y) * -0.5f;
        //    grid = Enumerable.Repeat(MAX_RADIUS, gridBounds.x * gridBounds.z).ToArray();
        //}

        //private void CheckWalls()
        //{
        //    for (int i = 0; i < grid.Length; i++)
        //    {
        //        Vector3 pos = GetGridPositionByIndex(i);
        //        if (Physics.CheckSphere(pos + offset, 1f, layersTaken))
        //        {
        //            grid[i] = 0f;
        //            ModifyGrid(Vector3Int.FloorToInt(pos), MAX_RADIUS);
        //        }
        //    }
        //}

        //[Button]
        //private void SpawnItems()
        //{
        //    for (int i = 0; i < itemsToSpawn.Count; i++)
        //    {
        //        int itemsSpawned = 0;
        //        int spawnsAttempts = 0;

        //        Vector3 randomGridPos;

        //        while (itemsSpawned < itemsToSpawn[i].SpawnAmount)
        //        {
        //            randomGridPos = new Vector3(Random.Range(OUTER_WALL_WIDTH, spawnZoneBounds.x), 0f, Random.Range(OUTER_WALL_WIDTH, spawnZoneBounds.z));
        //            if (grid[GetGridPosition(Vector3Int.FloorToInt(randomGridPos))] >= itemsToSpawn[i].Radius)
        //            {
        //                Transform spawnedTransform = itemsToSpawn[i].PoolType.GetFromPool().transform;
        //                spawnedTransform.position = randomGridPos + offset;
        //                ModifyGrid(Vector3Int.FloorToInt(randomGridPos), itemsToSpawn[i].Radius);
        //                itemsSpawned += 1;
        //                spawnsAttempts = 0;
        //            }

        //            if (++spawnsAttempts == spawnsFailedToExit)
        //            {
        //                Debug.LogError("Not enough space. Spawned " + itemsSpawned + " items.");
        //                return;
        //            }
        //        }
        //    }
        //}

        //[Button]
        //private void SpawnEnemy()
        //{
        //    for (int i = 0; i < enemiesToSpawn.Count; i++)
        //    {
        //        int enemiesSpawned = 0;
        //        int spawnsAttempts = 0;

        //        Vector3 randomGridPos;

        //        while (enemiesSpawned < enemiesToSpawn[i].SpawnAmount)
        //        {
        //            randomGridPos = new Vector3(Random.Range(OUTER_WALL_WIDTH, spawnZoneBounds.x), 0f, Random.Range(OUTER_WALL_WIDTH, spawnZoneBounds.z));
        //            if (grid[GetGridPosition(Vector3Int.FloorToInt(randomGridPos))] >= enemiesToSpawn[i].Radius)
        //            {
        //                var spawnedEnemyContainer = enemiesToSpawn[i].PoolType.GetFromPool().GetComponent<Containers.CharacterContainer>();
        //                spawnedEnemyContainer.Transform.SetPositionAndRotation(randomGridPos + offset, Quaternion.identity);
        //                spawnedEnemyContainer.Init();
        //                ModifyGrid(Vector3Int.FloorToInt(randomGridPos), enemiesToSpawn[i].Radius);
        //                enemiesSpawned += 1;
        //                spawnsAttempts = 0;
        //            }

        //            if (++spawnsAttempts == spawnsFailedToExit)
        //            {
        //                Debug.LogError("Not enough space. Spawned " + enemiesSpawned + " enemies.");
        //                return;
        //            }
        //        }
        //    }
        //}

        //private void ModifyGrid(Vector3Int center, float radius)
        //{
        //    int diff = (int)MAX_RADIUS;
        //    int startX = Mathf.Max(0, center.x - diff);
        //    int endX = Mathf.Min(gridBounds.x - 1, center.x + diff);

        //    int startZ = Mathf.Max(0, center.z - diff);
        //    int endZ = Mathf.Min(gridBounds.z - 1, center.z + diff);

        //    Vector3Int pos = Vector3Int.zero;
        //    float dist;
        //    int index;

        //    for (int x = startX; x <= endX; x++)
        //    {
        //        pos.x = x;

        //        for (int z = startZ; z <= endZ; z++)
        //        {
        //            pos.z = z;
        //            dist = Vector3.Distance(center, pos);
        //            index = GetGridPosition(pos);

        //            if (dist <= radius)
        //                grid[index] = 0;
        //            else if (dist <= MAX_RADIUS + radius)
        //                grid[index] = Mathf.Min(grid[index], dist - radius);
        //        }
        //    }
        //}

        //private Vector3 GetGridPositionByIndex(int index) => new(index / gridBounds.z, 0, index % gridBounds.z);

        //private int GetGridPosition(Vector3Int vector) => (vector.x * gridBounds.z + vector.z);
    }
}
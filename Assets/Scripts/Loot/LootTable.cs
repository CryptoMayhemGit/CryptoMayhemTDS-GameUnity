using Assets.Scripts.Spawnable;
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Loot
{
    public class LootTable : MonoBehaviour
    {
        [System.Serializable]
        private class Loot
        {
            [SerializeField, Range(0.001f, 100f)] private float chance = 100f;
            [SerializeField, Min(1)] private int amount = 1;
            [SerializeField] private Pooling.SpawnableItemPool pool = null;

            public float Chance => chance;
            public int Amount => amount;
            public SpawnableItem GetSpawnedItem() => pool.GetFromPool();
        }

        [SerializeField] private CharacterContainer character = null;
        [SerializeField, Min(0.1f)] private float dropRadius = 1f;
        [SerializeField] private Loot[] loot = new Loot[0];

        public void Drop()
        {
            Vector3 randomPoint;
            Quaternion randomRotation;
            SpawnableItem spawnedItem;

            for (int i = 0; i < loot.Length; i++)
            {
                if (Random.Range(0f, 99f) < loot[i].Chance)
                {
                    for (int j = 0; j < loot[i].Amount; j++)
                    {
                        randomPoint = character.Transform.position + Random.insideUnitSphere * dropRadius;
                        randomPoint.y = 0f;

                        randomRotation = Quaternion.Euler(0, Random.Range(0f, 360f), 0f);

                        spawnedItem = loot[i].GetSpawnedItem();
                        spawnedItem.Transform.SetPositionAndRotation(randomPoint, randomRotation);
                        spawnedItem.Init(character);
                    }
                }
            }
        }
    }
}
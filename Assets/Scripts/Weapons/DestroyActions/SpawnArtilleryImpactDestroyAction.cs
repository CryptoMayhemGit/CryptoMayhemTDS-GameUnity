using Assets.Scripts.Weapons.ArtilleryImpacts;
using UnityEngine;

namespace Assets.Scripts.Weapons.DestroyActions
{
    public class SpawnArtilleryImpactDestroyAction : DestroyAction
    {
        [SerializeField] private Pooling.ArtilleryImpactPool pool = null;
        [SerializeField, Min(1)] private int amount = 3;
        [SerializeField, Min(0.1f)] private float spawnRadius = 3f;
        [SerializeField] private ArtilleryImpactCore artilleryImpactCore = new();

        public override void OnDestroy(Containers.CharacterContainer owner, Vector3 position, Quaternion rotation)
        {
            ArtilleryImpact artilleryImpact;

            for (int i = 0; i < amount; i++)
            {
                artilleryImpact = pool.GetFromPool();
                artilleryImpact.Transform.position = position + RandomPosInCircle(spawnRadius);
                artilleryImpact.Init(owner, artilleryImpactCore, pool);
            }
        }

        private Vector3 RandomPosInCircle(float radius)
        {
            Vector2 circlePosition = Random.insideUnitCircle * radius;

            return new Vector3(circlePosition.x, 0, circlePosition.y);
        }
    }
}
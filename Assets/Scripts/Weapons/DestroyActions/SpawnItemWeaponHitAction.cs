using UnityEngine;

namespace Assets.Scripts.Weapons.DestroyActions
{
    public class SpawnItemWeaponHitAction : DestroyAction
    {
        [SerializeField] private Pooling.SpawnableItemPool pool = null;

        public override void OnDestroy(Containers.CharacterContainer container, Vector3 position, Quaternion rotation)
        {
            var spawnableItem = pool.GetFromPool();
            spawnableItem.Transform.position = position;
            spawnableItem.Init(container);
        }
    }
}
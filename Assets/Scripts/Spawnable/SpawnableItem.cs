using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.Spawnable
{
    public abstract class SpawnableItem : MonoBehaviour
    {
        [field: SerializeField] public Transform Transform { private set; get; } = null;
        [SerializeField] protected Pooling.SpawnableItemPool Pool = null;
        [SerializeField] protected FMODUnity.EventReference spawnSound = default;

        public abstract void Init(CharacterContainer owner, object valueToSet = null);
    }
}
using UnityEngine;

namespace Assets.Scripts.Interactions.Objects
{
    public abstract class InteractionObject : MonoBehaviour
    {
        [field: SerializeField] public Transform Transform { private set; get; } = null;

        public abstract void Interact(Containers.PlayerContainer player);
    }
}
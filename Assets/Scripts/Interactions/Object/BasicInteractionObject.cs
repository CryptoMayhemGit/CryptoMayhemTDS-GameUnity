using UnityEngine;

namespace Assets.Scripts.Interactions.Objects
{
    public class BasicInteractionObject : InteractionObject
    {
        [SerializeField] private UltEvents.UltEvent onInteraction = new();

        public override void Interact(Containers.PlayerContainer player)
        {
            onInteraction.Invoke();
        }
    }
}
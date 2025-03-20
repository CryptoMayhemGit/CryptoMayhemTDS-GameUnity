using UnityEngine;

namespace Assets.Scripts.Interactions
{
    public class PlayerInteractions : CharacterComponent
    {
        [SerializeField] private Containers.PlayerContainer player = null;
        [SerializeField] private LayerMask interactionLayer = 0;
        [SerializeField, Min(1)] private float range = 2f;

        public void Interact()
        {
            var interactions = Physics.OverlapSphere(player.Transform.position, range, interactionLayer);
            float distance = Mathf.Infinity;
            Transform closestInteraction = null;

            for (int i = 0; i < interactions.Length; i++)
            {
                float dist = (interactions[i].transform.position - player.Transform.position).sqrMagnitude;

                if (dist < distance)
                {
                    distance = dist;
                    closestInteraction = interactions[i].transform;
                }
            }

            if (closestInteraction != null)
                closestInteraction.GetComponent<Objects.InteractionObject>().Interact(player);
        }
    }
}
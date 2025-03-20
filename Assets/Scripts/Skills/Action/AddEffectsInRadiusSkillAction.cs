using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.Effects;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class AddEffectsInRadiusSkillAction : SkillAction
    {
        [SerializeField, Min(0.1f)] private float radius = 2f;
        [SerializeField] private LayerMask targetLayer = default;
        [SerializeField] private List<Effect> effects = null;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            CharacterContainer container;

            foreach (Collider collider in Physics.OverlapSphere(origin.Transform.position, radius, targetLayer))
            {
                container = collider.GetComponent<CharacterContainer>();
                foreach (Effect effect in effects)
                    container.Effects.AddEffect(effect);
            }
        }
    }
}
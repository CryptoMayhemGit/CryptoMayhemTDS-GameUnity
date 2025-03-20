using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class InfectEffectAction : EffectAction
    {
        [SerializeField] private System.Collections.Generic.List<Effect> effects = new();
        [SerializeField, Min(0.5f)] private float radius = 2f;
        [SerializeField] private bool infectSelf = false;

        public override void Tick(CharacterContainer container)
        {
            Collider[] colliders = Physics.OverlapSphere(container.Transform.position, radius, 1 << container.gameObject.layer);
            CharacterContainer target;

            for (int i = 0; i < colliders.Length; i++)
            {
                target = colliders[i].GetComponent<CharacterContainer>();

                if (target != container || infectSelf)
                    foreach (var item in effects)
                        target.Effects.AddEffect(item);
            }
        }
    }
}

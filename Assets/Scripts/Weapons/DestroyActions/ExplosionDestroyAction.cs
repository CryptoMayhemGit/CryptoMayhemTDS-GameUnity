using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Weapons.DestroyActions
{
    public class ExplosionDestroyAction : DestroyAction
    {
        [SerializeField, Min(0.1f)] private float radius = 0.1f;
        [SerializeField] private LayerMask layerToTrigger = default;
        [SerializeField] private Pooling.TransformPool pool = null;
        [SerializeField] private SerializedDictionary<Damage.DamageType, float> damageTypes = new();

        public override void OnDestroy(CharacterContainer owner, Vector3 position, Quaternion rotation)
        {
            Transform explosion = pool.GetFromPool();
            explosion.position = position;
            explosion.localScale = new Vector3(radius, radius, radius);

            var hits = Physics.OverlapSphere(position, radius, layerToTrigger);
            CharacterContainer hitContainer;

            foreach (var hit in hits)
            {
                hitContainer = hit.GetComponent<CharacterContainer>();

                foreach (var type in damageTypes)
                    hitContainer.Health.DealDamage(type.Key, type.Value);
            }
        }
    }
}
using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.Damage;
using UnityEngine;

namespace Assets.Scripts.Spawnable
{
    public class GoliathDecoy : Decoy
    {
        [SerializeField, Min(0.1f)] private float movementSpeed = 20f;
        [SerializeField] private LayerMask explosionTargetLayer = 0;
        [SerializeField, Min(0.1f)] private float explosionRadius = 10f;
        [SerializeField, Min(0.1f)] private float explosionDamageAmount = 100f;
        [SerializeField] private DamageType explosionDamageType = null;

        private Vector3 travelDirection;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            base.Init(owner);
            gameManager.Value.OnFixedUpdate += UpdateFixedTick;
            travelDirection = (((PlayerContainer)owner).Input.CannonTarget - owner.Transform.position).normalized;
            character.Rigidbody.rotation = Quaternion.LookRotation(travelDirection);
        }

        public override void ReturnToPool()
        {
            gameManager.Value.OnFixedUpdate -= UpdateFixedTick;
            SelfDestructionWithExplosion();
            base.ReturnToPool();
        }

        private void UpdateFixedTick()
        {
            character.Rigidbody.velocity = travelDirection * movementSpeed;
        }

        private void SelfDestructionWithExplosion()
        {
            foreach (Collider collider in Physics.OverlapSphere(character.Transform.position, explosionRadius, explosionTargetLayer))
                collider.GetComponent<CharacterContainer>().Health.DealDamage(explosionDamageType, explosionDamageAmount);
        }
    }
}
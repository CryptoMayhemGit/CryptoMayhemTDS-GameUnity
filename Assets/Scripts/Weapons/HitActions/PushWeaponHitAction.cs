using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Weapons.HitActions
{
    public class PushWeaponHitAction : HitAction
    {
        [SerializeField, Min(1)] private float force = 100f;

        public override void OnHit(CharacterContainer owner, CharacterContainer target)
        {
            if (target == null || owner == null) return;
            target.Rigidbody.velocity = Vector3.zero;
            target.Rigidbody.AddForce((target.Transform.position - owner.Transform.position).normalized * force, ForceMode.Impulse);
        }
    }
}
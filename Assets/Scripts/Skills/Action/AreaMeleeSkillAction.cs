using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class AreaMeleeSkillAction : SkillAction
    {
        [SerializeField] private float range = 10f;
        [SerializeField] private LayerMask targetLayer = 0;
        [SerializeField] private float spreadAngle = 30f;
        [SerializeField] private SerializedDictionary<Damage.DamageType, float> damageTypes = new();

        private AnimationCurve spreadProfile = new AnimationCurve(new Keyframe(0, 2f), new Keyframe(0.5f, 0.75f), new Keyframe(1f, 0.4f));

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            Vector3 shootDirection = origin.AttackPivot.forward;
            shootDirection.y = 0;
            CharacterContainer target;

            foreach (Collider collider in Physics.OverlapSphere(origin.AttackPivot.position, range, targetLayer))
            {
                float distance = (collider.transform.position - origin.AttackPivot.position).sqrMagnitude;
                float checkAngle = spreadAngle * spreadProfile.Evaluate(Mathf.InverseLerp(0, range * range, distance));
                if (Vector3.Angle((collider.transform.position - origin.AttackPivot.position).normalized, shootDirection) <= checkAngle)
                {
                    target = collider.GetComponent<CharacterContainer>();
                    foreach (var item in damageTypes)
                        target.Health.DealDamage(item.Key, item.Value);
                }
            }
        }
    }
}
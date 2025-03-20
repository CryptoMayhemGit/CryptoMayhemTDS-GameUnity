using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class EnemyChargeSkillAction : SkillAction
    {
        [SerializeField] private float chargeForce = 400f;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            origin.Rigidbody.AddForce((targetPosition - origin.Transform.position).normalized * chargeForce, ForceMode.Impulse);
        }
    }
}
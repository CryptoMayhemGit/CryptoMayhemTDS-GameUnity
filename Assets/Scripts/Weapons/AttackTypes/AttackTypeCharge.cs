using UnityEngine;

namespace Assets.Scripts.Weapons.AttackTypes
{
    public class AttackTypeCharge : AttackType
    {
        [SerializeField, Min(0.1f)] private float chargeTime = 0.5f;

        private float time;

        public override void OnStart()
        {
            time = chargeTime;
        }

        public override bool OnUpdate()
        {
            if (time > 0 && (time -= Time.deltaTime) <= 0)
            {
                Shoot();
                return false;
            }
            else
                return true;
        }
    }
}
namespace Assets.Scripts.Weapons.AttackTypes
{
    public class AttackTypeNormal : AttackType
    {
        public override bool OnUpdate()
        {
            Shoot();
            return false;
        }
    }
}
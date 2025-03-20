namespace Assets.Scripts.Weapons.AttackTypes
{
    public class AttackTypeAuto : AttackType
    {
        public override bool OnUpdate()
        {
            Shoot();
            return true;
        }
    }
}
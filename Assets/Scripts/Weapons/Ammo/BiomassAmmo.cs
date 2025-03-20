namespace Assets.Scripts.Weapons.Ammo
{
    public class BiomassAmmo : WeaponAmmo
    {
        public override bool CanShoot() => biomass.DynamicValue >= biomassPerShot;
        public override void SubtractAmmo()
        {
            biomass.ModifyDynamicValue(-biomassPerShot);
            Reload();
        }

        public override void Reload()
        {
            if(reloadSound.IsNull == true)
            {
                return;
            }

            FMODUnity.RuntimeManager.PlayOneShot(reloadSound, playerContainer.AttackPivot.position);
        }
    }
}
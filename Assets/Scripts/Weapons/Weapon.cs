using Assets.Scripts.Weapons.Ammo;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Weapons
{
    public abstract class Weapon : Inventory.Item
    {
        [FoldoutGroup("Visual"), SerializeField] private Transform weaponVisual = null;
        [FoldoutGroup("Functional"), SerializeReference] protected WeaponAmmo ammo = new BiomassAmmo();
        [FoldoutGroup("Functional"), SerializeField, Min(0.1f)] private float attackCooldown = 0.5f;
        [FoldoutGroup("Functional"), SerializeField] protected FMODUnity.EventReference shotSound = default;

        private float attackTime;

        public virtual void Init(Containers.PlayerContainer player, Transform parentPivot, bool isRight)
        {
            ammo.Init(player);
            Instantiate(weaponVisual, parentPivot);
        }

        public WeaponAmmo GetWeaponAmmo() => ammo;
        
        public void Reload() => ammo.Reload();

        public Transform GetWeaponVisual() => weaponVisual;

        public abstract void StartAttack();
        public abstract bool UpdateAttack();
        public abstract void StopAttack();

        public bool IsCooldownReady() => attackTime <= Time.time;
        protected void SetOnCooldown() => attackTime = Time.time + attackCooldown;
    }
}
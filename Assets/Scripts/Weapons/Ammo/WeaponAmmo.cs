using System;
using Assets.Scripts.Stats;
using UnityEngine;

namespace Assets.Scripts.Weapons.Ammo
{
    [Serializable]
    public abstract class WeaponAmmo
    {
        [SerializeField] protected float biomassPerShot = 5f;
        [SerializeField] private StatType biomassStat = null;
        [SerializeField] protected FMODUnity.EventReference reloadSound = default;
        
        protected DynamicStat biomass;
        protected Containers.PlayerContainer playerContainer;

        public virtual void Init(Containers.PlayerContainer player)
        {
            biomass = player.Stats.GetDynamicStat(biomassStat);
            playerContainer = player;
        }

        public abstract bool CanShoot();
        public abstract void SubtractAmmo();
        public abstract void Reload();
    }
}
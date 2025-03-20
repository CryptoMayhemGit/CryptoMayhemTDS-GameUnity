using Assets.Scripts.Containers;
using Assets.Scripts.Effects;
using Assets.Scripts.Weapons.HitActions;
using FMOD.Studio;
using Sirenix.OdinInspector;
using System;
using UnityEngine;
using UnityEngine.Events;

namespace Assets.Scripts.Weapons
{
    [System.Serializable]
    public class ParticleWeaponEvent : UnityEvent<EnemyContainer>
    {
    }

    [CreateAssetMenu(menuName = "ScriptableObjects/Weapons/Particle")]
    public class ParticleWeapon : Weapon
    {
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private ManageParticleAttackSystem weaponEffectObject = null;
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private float range = 1;
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private int maxEnemies = 1;
        [FoldoutGroup("Functional"), SerializeField, Min(0.01f)] private float radius = 0.1f;
        [FoldoutGroup("Functional"), SerializeField] private Pooling.VisualEffectsPool muzzleEffect = null;
        [FoldoutGroup("Functional"), SerializeField] private Vector3 attackPivotXAxisOffset = new();
        [FoldoutGroup("Functional"), SerializeReference] private System.Collections.Generic.List<HitAction> hitActions = new();

        private ManageParticleAttackSystem weaponEffectInstance;
        private Func<bool> Shoot;
        private EventInstance soundInstance;
        public ParticleWeaponEvent OnHit = new ParticleWeaponEvent();
        private PlayerContainer owner;

        public override void Init(PlayerContainer player, Transform attackPivot, bool isRight)
        {
            base.Init(player, attackPivot, isRight);
            owner = player;

            weaponEffectInstance = Instantiate(weaponEffectObject, player.AttackPivot); //TODO Spawn GameObject z particle system.
            OnHit.AddListener(HitEnemy);
            weaponEffectInstance.SetParticleWeapon(this);

            Vector3 attackOffset = attackPivotXAxisOffset;
            if (isRight) attackOffset = new Vector3(-attackOffset.x, attackOffset.y, attackOffset.z);

            weaponEffectInstance.transform.localPosition = new Vector3(attackOffset.x, attackOffset.y, attackOffset.z);
            weaponEffectInstance.ParticleSystem.Stop(true);

            //soundInstance = FMODUnity.RuntimeManager.CreateInstance(shotSound);

            Shoot = () =>
            {
                if (!ammo.CanShoot())
                    return false;

                if (IsCooldownReady())
                {
                    SetOnCooldown();
                    ammo.SubtractAmmo();

                    //Jeżeli dotkneliśmy CharacterContainer to hit
                }


                //muzzleEffect.GetFromPool().Play(from, Quaternion.Euler(0, angle, 0), attackPivot);
                return true;
            };
        }

        void HitEnemy(EnemyContainer enemyContainer)
        {
            foreach (HitAction item in hitActions)
                item.OnHit(owner, enemyContainer);
        }

        public override void StartAttack()
        {
            weaponEffectInstance.ParticleSystem.Play(true);
            //soundInstance.start();

        }

        public override bool UpdateAttack() => Shoot();

        public override void StopAttack()
        {
            //soundInstance.stop(STOP_MODE.ALLOWFADEOUT);
            weaponEffectInstance.ParticleSystem.Stop(true);
        }
    }
}

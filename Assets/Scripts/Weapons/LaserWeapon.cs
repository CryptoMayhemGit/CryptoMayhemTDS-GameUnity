using Assets.Scripts.Containers;
using Assets.Scripts.Weapons.HitActions;
using Assets.Scripts.Weapons.WeponData;
using FMOD.Studio;
using Sirenix.OdinInspector;
using System;
using UnityEngine;
using UnityEngine.UIElements;

namespace Assets.Scripts.Weapons
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Weapons/Laser")]
    public class LaserWeapon : Weapon
    {
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private LaserLineRendererData laserLineRendererData = null;
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private float range = 1;
        [FoldoutGroup("Functional"), SerializeField] private LayerMask targetLayer = default;
        [FoldoutGroup("Functional"), SerializeField] private LayerMask obstacleLayer = default;
        [FoldoutGroup("Functional"), SerializeField, Min(1)] private int maxEnemies = 1;
        [FoldoutGroup("Functional"), SerializeField, Min(0.01f)] private float radius = 0.1f;
        [FoldoutGroup("Functional"), SerializeField] private Pooling.VisualEffectsPool muzzleEffect = null;
        [FoldoutGroup("Functional"), SerializeReference] private System.Collections.Generic.List<HitAction> hitActions = new();
        [FoldoutGroup("Functional"), SerializeField] private Vector3 attackPivotXAxisOffset = new();

        private LaserLineRendererData laserLineRendererDataInstance;
        private RaycastHit[] obstacleHit;
        private RaycastHit[] enemiesHits;
        private Func<bool> Shoot;
        private PlayerContainer owner;
        private EventInstance soundInstance;

        public override void Init(PlayerContainer player, Transform attackPivot, bool isRight)
        {
            base.Init(player, attackPivot, isRight);

            laserLineRendererDataInstance = Instantiate(laserLineRendererData, player.Transform);

            Vector3 attackOffset = attackPivotXAxisOffset;
            if (isRight) attackOffset = new Vector3(-attackOffset.x, attackOffset.y, attackOffset.z);

            owner = player;
            obstacleHit = new RaycastHit[1];
            enemiesHits = new RaycastHit[maxEnemies];

            soundInstance = FMODUnity.RuntimeManager.CreateInstance(shotSound);

            Shoot = () =>
            {
                if (!ammo.CanShoot())
                    return false;

                Vector3 from = attackPivot.position + (player.AttackPivot.rotation * attackOffset);
                Vector3 direction = player.AttackPivot.forward;
                Vector3 to = from + direction;
                float angle = Mathf.Atan2(to.z - from.z, from.x - to.x) * 180 / Mathf.PI - 90;
                float realRange = Physics.SphereCastNonAlloc(from, radius, direction, obstacleHit, range, obstacleLayer) == 1 ? obstacleHit[0].distance : range;
                int hitCount = Physics.SphereCastNonAlloc(from, radius, direction, enemiesHits, realRange, targetLayer);

                UpdateLineRenderer(from, direction, realRange);

                if (IsCooldownReady())
                {
                    SetOnCooldown();
                    ammo.SubtractAmmo();

                    for (int i = 0; i < hitCount; i++)
                        if (enemiesHits[i].transform.TryGetComponent(out CharacterContainer character))
                            foreach (HitAction item in hitActions)
                                item.OnHit(owner, character);
                }

                muzzleEffect.GetFromPool().Play(from, Quaternion.Euler(0, angle, 0), attackPivot);
                return true;
            };
        }

        private void UpdateLineRenderer(Vector3 from, Vector3 direction, float realRange)
        {
            foreach (LineRenderer lineRenderer in laserLineRendererDataInstance.GetLineRenderers())
            {
                lineRenderer.SetPosition(0, from);
                lineRenderer.SetPosition(1, from + direction * realRange);
            }
        }

        public override void StartAttack()
        {
            laserLineRendererDataInstance.gameObject.SetActive(true);
            soundInstance.start();

        }

        public override bool UpdateAttack() => Shoot();

        public override void StopAttack()
        {
            soundInstance.stop(STOP_MODE.ALLOWFADEOUT);
            laserLineRendererDataInstance.gameObject.SetActive(false);
        }
    }
}
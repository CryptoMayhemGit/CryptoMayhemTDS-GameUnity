using Assets.Scripts.Weapons.AttackTypes;
using Assets.Scripts.Weapons.Projectiles;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Weapons
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Weapons/Projectile")]
    public class ProjectileWeapon : Weapon
    {
        [FoldoutGroup("Functional"), SerializeField, Min(1), Space] private int projectileCount = 1;
        [FoldoutGroup("Functional"), SerializeField, MinMaxSlider(-180f, 180f, true), HideIf("@projectileCount == 1")] private Vector2 minMaxAngle = Vector2.zero;
        [FoldoutGroup("Functional"), SerializeField] private Pooling.ProjectilePool pool = null;
        [FoldoutGroup("Functional"), SerializeField] private Pooling.VisualEffectsPool muzzleEffect = null;
        [FoldoutGroup("Functional"), SerializeReference] private AttackType attackType = new AttackTypeNormal();
        [FoldoutGroup("Functional"), SerializeField] private Vector3 attackPivotXAxisOffset = new();
        [FoldoutGroup("Functional"), SerializeField, Space] private ProjectileCore projectileCore = new();
        [FoldoutGroup("Functional"), SerializeField, Space] private GameEvent onCameraShake = null;

        public override void Init(Containers.PlayerContainer player, Transform attackPivot, bool isRight)
        {
            base.Init(player, attackPivot, isRight);

            Vector3 attackOffset = attackPivotXAxisOffset;
            if (isRight) attackOffset = new Vector3(-attackOffset.x, attackOffset.y, attackOffset.z);

            attackType.Init(() =>
            {
                SetOnCooldown();
                ammo.SubtractAmmo();

                Vector3 from = attackPivot.position + (player.AttackPivot.rotation * attackOffset);
                Vector3 to = from + player.AttackPivot.forward;
                Projectile projectile;

                float angle = Mathf.Atan2(to.z - from.z, from.x - to.x) * 180 / Mathf.PI - 90;
                for (int i = 0; i < projectileCount; i++)
                {
                    float projectileAngle = angle;
                    if (projectileCount != 1)
                        projectileAngle += Mathf.Lerp(minMaxAngle.x, minMaxAngle.y, (float)i / (projectileCount - 1));

                    projectile = pool.GetFromPool();
                    projectile.Transform.SetPositionAndRotation(from, Quaternion.Euler(0, projectileAngle, 0));
                    projectile.Init(player, projectileCore, pool);
                }

                onCameraShake.Raise();
                FMODUnity.RuntimeManager.PlayOneShot(shotSound, from);
                muzzleEffect.GetFromPool().Play(from, Quaternion.Euler(0, angle, 0), attackPivot);
            });
        }

        public override void StartAttack()
        {
            attackType.OnStart();
        }

        public override bool UpdateAttack()
        {
            if (!ammo.CanShoot())
                return false;

            if (IsCooldownReady())
                return attackType.OnUpdate();

            return true;
        }

        public override void StopAttack() { }
    }
}
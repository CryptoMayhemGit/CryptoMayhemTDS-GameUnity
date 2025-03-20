using Assets.Scripts.Containers;
using Assets.Scripts.Weapons.Projectiles;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class ProjectileSkillAction : SkillAction
    {
        [SerializeField] private float projectileCount = 1;
        [SerializeField, MinMaxSlider(-180f, 180f, true), HideIf("@projectileCount == 1")] private Vector2 minMaxAngle = Vector2.zero;
        [SerializeField] private Pooling.ProjectilePool pool = null;
        [SerializeField] private ProjectileCore projectileCore = null;

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            Vector3 from = origin.Transform.position;
            Vector3 to = targetPosition;
            Projectile projectile;

            for (int i = 0; i < projectileCount; i++)
            {
                float angle = Mathf.Atan2(to.z - from.z, from.x - to.x) * 180 / Mathf.PI - 90;
                if (projectileCount != 1)
                    angle += Mathf.Lerp(minMaxAngle.x, minMaxAngle.y, (float)i / (projectileCount - 1));

                projectile = pool.GetFromPool();
                projectile.Transform.SetPositionAndRotation(from, Quaternion.Euler(0, angle, 0));
                projectile.Init(origin, projectileCore, pool);
            }
        }
    }
}
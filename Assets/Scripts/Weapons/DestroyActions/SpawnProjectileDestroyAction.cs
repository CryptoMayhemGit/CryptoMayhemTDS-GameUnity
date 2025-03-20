using Assets.Scripts.Weapons.Projectiles;
using UnityEngine;

namespace Assets.Scripts.Weapons.DestroyActions
{
    public class SpawnProjectileDestroyAction : DestroyAction
    {
        [SerializeField, Min(1)] private int projectileCount = 1;
        [SerializeField, Sirenix.OdinInspector.MinMaxSlider(-180f, 180f, true)] private Vector2 minMaxAngle = Vector2.zero;
        [SerializeField] private Pooling.ProjectilePool pool = null;
        [SerializeReference] private ProjectileCore projectileCore = new();

        public override void OnDestroy(Containers.CharacterContainer container, Vector3 position, Quaternion rotation)
        {
            Projectile projectile;

            for (int i = 0; i < projectileCount; i++)
            {
                float angle = rotation.eulerAngles.y;
                if (projectileCount != 1)
                    angle += Mathf.Lerp(minMaxAngle.x, minMaxAngle.y, (float)i / (projectileCount - 1));

                projectile = pool.GetFromPool();
                projectile.Transform.SetPositionAndRotation(position, Quaternion.Euler(0, angle, 0));
                projectile.Init(container, projectileCore, pool);
            }
        }
    }
}
using Assets.Scripts.Containers;
using Assets.Scripts.Pooling;
using Pathfinding.Util;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Weapons.Projectiles
{
    public class Projectile : MonoBehaviour
    {
        [field: SerializeField] public Transform Transform { private set; get; } = null;
        [SerializeField] private Rigidbody rb = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private FMODUnity.EventReference impactSound = default;

        private CharacterContainer owner;
        private ProjectileCore core;
        private ProjectilePool pool;

        private float time;

        public void Init(CharacterContainer character, ProjectileCore projectileCore, ProjectilePool pool)
        {
            rb.rotation = Transform.rotation;
            rb.velocity = Vector3.zero;

            owner = character;
            core = projectileCore;
            this.pool = pool;

            time = 0f;

            gameManager.Value.OnUpdate += UpdateLifeTime;
            gameManager.Value.OnFixedUpdate += Move;
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other.TryGetComponent(out CharacterContainer character))
            {
                foreach (var item in core.HitActions)
                    item.OnHit(owner, character);

                if (core.DestroyOnHit)
                    ReturnToPool();
            }
            else
            {
                if(impactSound.IsNull == false)
                {
                    FMODUnity.RuntimeManager.PlayOneShot(impactSound, Transform.position);
                }

                ReturnToPool();
            }

            core.EffectsPool.GetFromPool().Play(Transform.position);
        }

        private void UpdateLifeTime()
        {
            Profiler.BeginSample("Projectile.UpdateLifeTime");
            if ((time += Time.deltaTime) >= core.ProjectileLifeTime)
                ReturnToPool();
            Profiler.EndSample();
        }

        private void Move()
        {
            core.MoveType.Move(rb, core.Speed, time / core.ProjectileLifeTime);
        }

        private void ReturnToPool()
        {
            gameManager.Value.OnUpdate -= UpdateLifeTime;
            gameManager.Value.OnFixedUpdate -= Move;

            foreach (var item in core.DestroyActions)
                item.OnDestroy(owner, Transform.position, Transform.rotation);

            pool.ReturnToPool(this);
        }
    }
}
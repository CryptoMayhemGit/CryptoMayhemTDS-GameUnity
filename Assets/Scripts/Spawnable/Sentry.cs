using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.Spawnable
{
    public class Sentry : SpawnableItem
    {
        [SerializeField, Min(0.1f)] private float lifeTime = 0.1f;
        [SerializeField] private SentryContainer sentry = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        private float timer;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            timer = lifeTime;
            sentry.Spawn();
            gameManager.Value.OnUpdate += UpdateTick;
        }

        private void UpdateTick()
        {
            if ((timer -= Time.deltaTime) <= 0f)
                sentry.Despawn();
        }

        public void ReturnToPool()
        {
            gameManager.Value.OnUpdate -= UpdateTick;
            Pool.ReturnToPool(this);
        }
    }
}
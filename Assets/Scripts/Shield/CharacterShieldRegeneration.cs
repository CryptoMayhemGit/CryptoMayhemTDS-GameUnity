using Assets.Scripts.Stats;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Shield
{
    public class CharacterShieldRegeneration : CharacterComponent
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Damage.CharacterHealth health = null;
        [SerializeField] private CachedDynamicStat shield = new();
        [SerializeField] private CachedStat shieldRegen = new();
        [SerializeField] private float secondsWithoutHit = 5f;

        private float timeStartRegen;
        private bool isSubscribedToUpdate;

        public override void OnSpawn()
        {
            if (shield.Get().DynamicValue != shield.Get().Value)
                TrySubscribeOnUpdate();

            health.OnHit += GetHit;
        }

        public override void OnDespawn()
        {
            if (isSubscribedToUpdate)
                UnsubscribeOnUpdate();
                
            health.OnHit -= GetHit;
        }

        private void StartRegenShield()
        {
            Profiler.BeginSample("CharacterShieldRegeneration.StartRegenShield");
            if (Time.time >= timeStartRegen)
            {
                shield.Get().ModifyDynamicValue(shieldRegen.Get().Value * Time.deltaTime);
                if (shield.Get().DynamicValue == shield.Get().Value)
                    UnsubscribeOnUpdate();
            }
            Profiler.EndSample();
        }

        private void GetHit()
        {
            timeStartRegen = Time.time + secondsWithoutHit;
            TrySubscribeOnUpdate();
        }

        private void TrySubscribeOnUpdate()
        {
            if (!isSubscribedToUpdate)
            {
                gameManager.Value.OnUpdate += StartRegenShield;
                isSubscribedToUpdate = true;
            }
        }

        private void UnsubscribeOnUpdate()
        {
            gameManager.Value.OnUpdate -= StartRegenShield;
            isSubscribedToUpdate = false;
        }
    }
}
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Cooldowns
{
    public class CharacterCooldowns : CharacterComponent
    {
        private class Cooldown : ICooldown
        {
            public float CurrentTime { private set; get; }
            public float EndTime { private set; get; }

            public Cooldown(float value)
            {
                CurrentTime = 0f;
                EndTime = value;
            }

            public bool Update(float delta) => (CurrentTime += delta) >= EndTime;
        }

        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        public event Action<IUsable, ICooldown> OnCooldownAdd;
        public event Action<IUsable> OnCooldownRemove;

        private readonly Dictionary<IUsable, Cooldown> cooldowns = new();
        private readonly List<IUsable> cooldownsToRemove = new();

        public override void OnDespawn()
        {
            base.OnDespawn();
            ClearCooldowns();
        }

        public bool Contains(IUsable usable) => cooldowns.ContainsKey(usable);

        public void Add(IUsable usable)
        {
            Cooldown cooldown = new(usable.Cooldown);
            cooldowns.Add(usable, cooldown);
            OnCooldownAdd?.Invoke(usable, cooldown);

            if (cooldowns.Count == 1)
                gameManager.Value.OnUpdate += UpdateCooldowns;
        }

        public void ClearCooldowns()
        {
            if (cooldowns.Count > 0)
            {
                foreach (var item in cooldowns)
                    OnCooldownRemove?.Invoke(item.Key);

                cooldowns.Clear();

                gameManager.Value.OnUpdate -= UpdateCooldowns;
            }

            cooldownsToRemove.Clear();
        }

        private void UpdateCooldowns()
        {
            Profiler.BeginSample("CharacterCooldowns.UpdateCooldowns");
            foreach (var item in cooldowns)
            {
                if (item.Value.Update(Time.deltaTime))
                    cooldownsToRemove.Add(item.Key);
            }

            if (cooldownsToRemove.Count > 0)
            {
                foreach (var item in cooldownsToRemove)
                {
                    cooldowns.Remove(item);
                    OnCooldownRemove?.Invoke(item);
                }

                if (cooldowns.Count == 0)
                    gameManager.Value.OnUpdate -= UpdateCooldowns;

                cooldownsToRemove.Clear();
            }
            Profiler.EndSample();
        }
    }
}
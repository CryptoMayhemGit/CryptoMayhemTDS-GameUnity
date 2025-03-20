using Assets.Scripts.Containers;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Effects
{
    public class CharacterEffects : CharacterComponent
    {
        private class EffectInstance
        {
            private readonly Effect effect;
            private readonly Transform spawnedVisual;

            private float tickTime;
            private int ticks;

            public EffectInstance(Effect effect, CharacterContainer container)
            {
                this.effect = effect;
                tickTime = effect.UseTickAtBegin ? 0 : effect.TickTime;
                ticks = effect.TicksAmount;

                effect.Begin(container);

                if (effect.VisualPool != null)
                {
                    spawnedVisual = effect.VisualPool.GetFromPool();
                    spawnedVisual.SetParent(container.Transform, false);
                    spawnedVisual.localScale = container.Size;
                }
            }

            public void Renew() => effect.Renew(ref tickTime, ref ticks);

            public bool Update(CharacterContainer container, float delta)
            {
                if ((tickTime -= delta) <= 0)
                {
                    tickTime += effect.TickTime;
                    ticks -= 1;
                    effect.Tick(container);
                }

                return ticks == 0;
            }

            public void End(CharacterContainer container)
            {
                if (spawnedVisual != null)
                    effect.VisualPool.ReturnToPool(spawnedVisual);

                effect.End(container);
            }
        }

        [SerializeField] private CharacterContainer character = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        private readonly System.Collections.Concurrent.ConcurrentDictionary<Effect, EffectInstance> effects = new();

        public override void OnDespawn()
        {
            base.OnDespawn();
            ClearEffects();
        }

        public void AddEffect(Effect effect)
        {
            if (!isActive)
                return;

            if (effects.TryGetValue(effect, out var instance))
                instance.Renew();
            else if (effects.TryAdd(effect, new(effect, character)) && effects.Count == 1)
                gameManager.Value.OnUpdate += UpdateEffects;
        }

        public void RemoveEffect(Effect effect)
        {
            if (effects.Remove(effect, out var instance))
            {
                if (effects.Count == 0)
                    gameManager.Value.OnUpdate -= UpdateEffects;

                instance.End(character);
            }
        }

        public bool Contains(Effect effect) => effects.ContainsKey(effect);

        public void ClearEffects()
        {
            if (effects.Count > 0)
            {
                foreach (var effect in effects.Values)
                    effect.End(character);

                effects.Clear();

                gameManager.Value.OnUpdate -= UpdateEffects;
            }
        }

        private void UpdateEffects()
        {
            Profiler.BeginSample("CharacterEffects.UpdateEffects");
            foreach (var item in effects)
                if (item.Value.Update(character, Time.deltaTime))
                    RemoveEffect(item.Key);
            Profiler.EndSample();
        }
    }
}
using System.Collections.Generic;
using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class AreaOfEffect : SpawnableItem
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField, Min(0.1f)] private float lifeTime = 0.1f;
        [SerializeField, Min(0.1f)] private float areaRadius = 2f;
        [SerializeField] private Effects.Effect selectedEffect = null;

        private float lifeTimer;
        private List<PlayerContainer> playersInRange = new(2);

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            lifeTimer = lifeTime;
            transform.localScale = new Vector3(areaRadius * 2f, areaRadius * 2f, areaRadius * 2f);
            gameManager.Value.OnUpdate += UpdateTick;
        }

        private void OnTriggerEnter(Collider other)
        {
            PlayerContainer current = other.GetComponent<PlayerContainer>();
            current.Effects.AddEffect(selectedEffect);
            playersInRange.Add(current);
        }

        private void OnTriggerExit(Collider other)
        {
            PlayerContainer current = other.GetComponent<PlayerContainer>();
            current.Effects.RemoveEffect(selectedEffect);
            playersInRange.Remove(current);
        }

        private void UpdateTick()
        {
            Profiler.BeginSample("AreaOfEffect.UpdateTick");
            if ((lifeTimer -= Time.deltaTime) <= 0f)
            {
                gameManager.Value.OnUpdate -= UpdateTick;
                Pool.ReturnToPool(this);

                foreach (PlayerContainer player in playersInRange)
                    player.Effects.RemoveEffect(selectedEffect);

                playersInRange.Clear();
            }
            Profiler.EndSample();
        }
    }
}
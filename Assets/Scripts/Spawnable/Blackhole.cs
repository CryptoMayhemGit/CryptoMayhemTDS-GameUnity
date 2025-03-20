using System;
using System.Collections.Generic;
using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class Blackhole : SpawnableItem
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField, Min(1f)] private float lifeTime = 10;
        [SerializeField, Min(0.5f)] private float radius = 5;
        [SerializeField, Min(0.1f)] private float forwardForce = 100;
        [SerializeField, Min(0.1f)] private float sideForce = 30;
        [SerializeField, Min(0.1f)] private float rotationStep = 0.5f;
        [SerializeField, Min(1)] private int damageDealCount = 1;
        [SerializeField] private SerializedDictionary<Damage.DamageType, float> damageTypes = new();
        [SerializeField] private List<Effects.Effect> effectsAfter = null;

        private readonly List<CharacterContainer> interactedContainers = new();
        private readonly List<CharacterContainer> toRemoveContainers = new();
        private float currentLifeTime;
        private float timeBetweenDamage;
        private float currentDamageTime;
        private List<Action> actions = new();

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            currentLifeTime = 0;
            timeBetweenDamage = lifeTime / damageDealCount;
            currentDamageTime = timeBetweenDamage;
            transform.localScale = radius * 2 * Vector3.one;

            gameManager.Value.OnUpdate += UpdateTick;
            gameManager.Value.OnFixedUpdate += UpdateFixedTick;
        }

        private void OnTriggerEnter(Collider other)
        {
            interactedContainers.Add(other.GetComponent<CharacterContainer>());
            actions.Add(() => RemoveContainer(interactedContainers[^1]));
            interactedContainers[^1].OnDespawnAction += actions[^1];

            if (interactedContainers[^1] is EnemyContainer enemyContainer)
                enemyContainer.RichAI.enabled = false;
        }

        private void OnTriggerExit(Collider other)
        {
            var container = other.GetComponent<CharacterContainer>();
            RemoveContainer(container);
            foreach (var item in effectsAfter)
            {
                container.Effects.AddEffect(item);
            }
        }

        private void TryDealDamage()
        {
            if ((currentDamageTime += Time.deltaTime) >= timeBetweenDamage)
            {
                currentDamageTime = 0;

                foreach (var container in interactedContainers)
                    foreach (var damage in damageTypes)
                        container.Health.DealDamage(damage.Key, damage.Value);
            }
        }

        private void UpdateFixedTick()
        {
            Vector3 direction;
            Vector3 cross;

            foreach (var container in interactedContainers)
            {
                direction = new(Transform.position.x - container.Transform.position.x, 0, Transform.position.z - container.Transform.position.z);
                cross = Vector3.Cross(direction, Vector3.up);

                container.Rigidbody.AddForce(direction.normalized * forwardForce);
                container.Rigidbody.AddForce(cross.normalized * sideForce);
            }
        }

        private void UpdateTick()
        {
            Profiler.BeginSample("Blackhole.UpdateTick");
            TryDealDamage();

            if ((currentLifeTime += Time.deltaTime) < lifeTime)
            {
                if (toRemoveContainers.Count > 0)
                {
                    foreach (var toRemove in toRemoveContainers)
                        interactedContainers.Remove(toRemove);

                    toRemoveContainers.Clear();
                }

                foreach (var container in interactedContainers)
                    container.Transform.Rotate(Vector3.up * rotationStep);
            }
            else
            {
                gameManager.Value.OnUpdate -= UpdateTick;
                gameManager.Value.OnFixedUpdate -= UpdateFixedTick;

                for (int i = 0; i < interactedContainers.Count; i++)
                {
                    interactedContainers[i].OnDespawnAction -= actions[i];

                    if (interactedContainers[i] is EnemyContainer enemyContainer)
                        enemyContainer.RichAI.enabled = true;

                    foreach (var item in effectsAfter)
                    {
                        interactedContainers[i].Effects.AddEffect(item);
                    }
                }

                actions.Clear();
                interactedContainers.Clear();
                toRemoveContainers.Clear();
                Pool.ReturnToPool(this);
            }
            Profiler.EndSample();
        }

        private void RemoveContainer(CharacterContainer character)
        {
            int index = interactedContainers.IndexOf(character);
            interactedContainers[index].OnDespawnAction -= actions[index];

            if (character is EnemyContainer enemyContainer)
                enemyContainer.RichAI.enabled = true;

            toRemoveContainers.Add(character);
            actions.RemoveAt(index);
        }
    }
}
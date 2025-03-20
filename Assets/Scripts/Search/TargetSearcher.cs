using System;
using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using UnityEngine;
using Sirenix.OdinInspector;
using UnityEngine.Profiling;

namespace Assets.Scripts.Search
{
    public class TargetSearcher : CharacterComponent
    {
        [SerializeField] private CharacterContainer character = null;
        [SerializeField] private GameManagerVariable gameManager = null;
        [SerializeField] private LayerMask targetMask = 0;
        [SerializeField] private float searchRadius = 30f;
        [SerializeField, Range(1f, 9f)] private float refreshRate = 1f;

        [ShowInInspector, ReadOnly]
        public CharacterContainer ClosestTarget
        {
            get
            {
                if (injectedTarget != null)
                    return injectedTarget;

                return foundTarget;
            }

            set => injectedTarget = value;
        }

        private float startTime;
        private CharacterContainer foundTarget;
        private CharacterContainer injectedTarget;

        public override void OnDespawn()
        {
            base.OnDespawn();
            injectedTarget = null;
            foundTarget = null;
        }

        private void OnEnable() => gameManager.Value.OnUpdate += UpdateTimer;
        private void OnDisable() => gameManager.Value.OnUpdate -= UpdateTimer;

        private void UpdateTimer()
        {
            Profiler.BeginSample("TargetSearcher.UpdateTimer");
            if (startTime + refreshRate >= Time.time)
            {
                Profiler.EndSample();
                return;
            }

            startTime = Time.time;
            RefreshClosestTarget();
            Profiler.EndSample();
        }

        private void RefreshClosestTarget()
        {
            float currentDistance;

            float closestDistance = float.MaxValue;
            Collider closest = null;

            foreach (Collider collider in Physics.OverlapSphere(character.Transform.position, searchRadius, targetMask))
            {
                currentDistance = (collider.transform.position - character.Transform.position).sqrMagnitude;

                if (currentDistance < closestDistance)
                {
                    closestDistance = currentDistance;
                    closest = collider;
                }
            }

            foundTarget = closest != null ? closest.GetComponent<CharacterContainer>() : null;
        }
    }
}
using Assets.Scripts.Containers;
using System;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Spawnable
{
    public class Mine : SpawnableItem
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Pooling.VisualPool visualPool = null;
        [SerializeField] private FMODUnity.StudioEventEmitter soundEmitter = null;
        [SerializeField, Min(0f)] private float prepareTime = 1f;
        [SerializeField, Min(0.1f)] private float tickTime = 0.5f;
        [SerializeField, Min(1)] private int ticksAmount = 1;
        [SerializeReference] private MineActions.MineAction mineAction = null;

        private readonly List<CharacterContainer> unitsInRange = new();
        private readonly List<CharacterContainer> tempUnits = new();

        private List<Action> actions = new();

        private float time;
        private bool prepared;
        private bool activated;
        private int ticks;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            time = 0f;
            prepared = false;
            activated = false;
            ticks = 0;

            gameManager.Value.OnUpdate += Prepare;
        }

        private void OnTriggerEnter(Collider other)
        {
            unitsInRange.Add(other.GetComponent<CharacterContainer>());
            actions.Add(() => RemoveUnit(unitsInRange[^1]));
            unitsInRange[^1].OnDespawnAction += actions[^1];

            if (prepared && !activated)
                Active();
        }

        private void OnTriggerExit(Collider other)
        {
            RemoveUnit(other.GetComponent<CharacterContainer>());
        }

        private void RemoveUnit(CharacterContainer unit)
        {
            if (unit == null) return;
            int index = unitsInRange.IndexOf(unit);
            if (index > -1 || index < unitsInRange.Count)
                unitsInRange[index].OnDespawnAction -= actions[index];

            unitsInRange.RemoveAt(index);
            actions.RemoveAt(index);
        }

        private void Prepare()
        {
            if ((time += Time.deltaTime) >= prepareTime)
            {
                gameManager.Value.OnUpdate -= Prepare;
                prepared = true;

                if (unitsInRange.Count > 0)
                    Active();
            }
        }

        private void Active()
        {
            soundEmitter.Play();
            time = 0f;
            activated = true;
            if (visualPool != null)
                visualPool.GetFromPool().Init(transform);
            
            gameManager.Value.OnUpdate += TriggerAction;
        }

        private void TriggerAction()
        {
            if ((time += Time.deltaTime) >= tickTime)
            {
                time -= tickTime;
                ticks += 1;

                tempUnits.AddRange(unitsInRange);

                foreach (var unit in tempUnits)
                    mineAction.Trigger(unit);

                tempUnits.Clear();

                if (ticks == ticksAmount)
                {
                    for (int i = 0; i < unitsInRange.Count; i++)
                    {
                        unitsInRange[i].OnDespawnAction -= actions[i];
                    }

                    actions.Clear();
                    unitsInRange.Clear();

                    gameManager.Value.OnUpdate -= TriggerAction;
                    Pool.ReturnToPool(this);
                }
            }
        }
    }
}
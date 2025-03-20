using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.AI.Action;
using UnityEngine;

namespace Assets.Scripts.AI.Nodes
{
    public class AIState : AINode
    {
        [SerializeField] private float elapsedTime = 0;
        [SerializeReference] private List<AIAction> actions = new();

        public float ElapsedTime => elapsedTime;

        public void OnStart(CharacterContainer character)
        {
            elapsedTime = 0;
            foreach (AIAction current in actions)
                current.OnStart(character);
        }

        public void OnUpdate(CharacterContainer character)
        {
            elapsedTime += Time.deltaTime;
            foreach (AIAction current in actions)
                current.OnUpdate(character, elapsedTime);
        }

        public void OnEnd(CharacterContainer character)
        {
            foreach (AIAction current in actions)
                current.OnEnd(character);
        }
    }
}
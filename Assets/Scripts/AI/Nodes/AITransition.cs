using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.AI.Condition;
using UnityEngine;

namespace Assets.Scripts.AI.Nodes
{
    public class AITransition : AINode
    {
        [SerializeReference] private List<AICondition> conditions = new();

        public bool CheckConditions(CharacterContainer character)
        {
            foreach (AICondition current in conditions)
                if (!current.Check(character))
                    return false;

            return true;
        }
    }
}
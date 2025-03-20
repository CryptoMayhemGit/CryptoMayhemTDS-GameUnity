using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.AI.Nodes
{
    public abstract class AINode : ScriptableObject
    {
        [SerializeField, HideInInspector] private List<AINode> outputs = new();
        [SerializeField, HideInInspector] private Vector3 nodePosition = Vector3.zero;

        public IReadOnlyList<AINode> Outputs => outputs;

        public virtual void SetNodePosition(Vector3 position) => nodePosition = position;
        public virtual void AddOutputNode(AINode node) => outputs.Add(node);
        public virtual void SetOutputNode(AINode node, int index) => outputs[index] = node;
        public virtual void RemoveOutputNode(AINode node) => outputs.Remove(node);
    }
}
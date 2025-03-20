using Assets.Scripts.AI.Nodes;
using UnityEngine;
using Sirenix.OdinInspector;

namespace Assets.Scripts.AI
{
    [CreateAssetMenu]
    public class AIStateMachine : ScriptableObject
    {
        [SerializeField, ReadOnly] private AIState defaultState = null;
        [SerializeField, HideInInspector] private Vector3 viewPosition = Vector3.zero;
        [SerializeField, HideInInspector] private Vector3 viewScale = Vector3.one;

        public AIState GetDefaultState => defaultState;
    }
}
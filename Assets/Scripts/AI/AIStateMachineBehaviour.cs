using Assets.Scripts.Containers;
using Assets.Scripts.SOArchitecture;
using Assets.Scripts.AI.Nodes;
using UnityEngine;
using Sirenix.OdinInspector;
using UnityEngine.Profiling;

namespace Assets.Scripts.AI
{
    public class AIStateMachineBehaviour : CharacterComponent
    {
        [SerializeField] private AIStateMachine stateMachine = null;
        [SerializeField] private GameManagerVariable gameManager = null;
        [SerializeField] private CharacterContainer character = null;

        public event System.Action<AIState, AIState> OnCurrentStateChanged;

        [ShowInInspector, ReadOnly] private AIState defaultState;
        [ShowInInspector, ReadOnly] private AIState currentState;
        [ShowInInspector, ReadOnly] private bool isInitialized;

        public AIState CurrentState => currentState;

        private void Init()
        {
            defaultState = (AIState)CreateCopyOfAINode(stateMachine.GetDefaultState);
            isInitialized = true;
        }

        public void ChangeStateMachine(AIStateMachine stateMachine)
        {
            defaultState = (AIState)CreateCopyOfAINode(stateMachine.GetDefaultState);
            isInitialized = false;
            currentState = defaultState;
            currentState.OnStart(character);
        }

        public override void OnSpawn()
        {
            if (!isInitialized)
                Init();

            base.OnSpawn();
            currentState = defaultState;
            currentState.OnStart(character);
            gameManager.Value.OnUpdate += OnUpdate;
        }

        public override void OnDespawn()
        {
            base.OnDespawn();
            gameManager.Value.OnUpdate -= OnUpdate;
            currentState.OnEnd(character);
        }

        public void SetActive(bool isActive)
        {
            if (isActive)
                OnSpawn();
            else
                OnDespawn();
        }

        private void OnUpdate()
        {
            Profiler.BeginSample("AIStateMachineBehaviour.OnUpdate");
            currentState.OnUpdate(character);

            foreach (AINode current in currentState.Outputs)
                if (((AITransition)current).CheckConditions(character))
                {
                    ChangeState(current.Outputs[0] is AIState state ? state : defaultState);
                    break;
                }
            Profiler.EndSample();
        }

        private AINode CreateCopyOfAINode(AINode toCopy)
        {
            AINode copy = Instantiate(toCopy);
            copy.name = $"{copy.GetType().Name}_Instance";

            for (int i = 0; i < toCopy.Outputs.Count; i++)
                copy.SetOutputNode(CreateCopyOfAINode(toCopy.Outputs[i]), i);

            return copy;
        }

        private void ChangeState(AIState nextState)
        {
            OnCurrentStateChanged?.Invoke(currentState, nextState);
            currentState.OnEnd(character);
            currentState = nextState;
            currentState.OnStart(character);
        }
    }
}
using System.Reflection;
using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEditor;
using Sirenix.OdinInspector.Editor;

namespace Assets.Scripts.AI.Editor
{
    [CustomEditor(typeof(AIStateMachineBehaviour))]
    public class AIStateMachineBehaviourEditor : OdinEditor
    {
        private FieldInfo stateMachineField = (typeof(AIStateMachineBehaviour).GetField("stateMachine", BindingFlags.Instance | BindingFlags.NonPublic));
        private FieldInfo defaultStateField = (typeof(AIStateMachineBehaviour).GetField("defaultState", BindingFlags.Instance | BindingFlags.NonPublic));

        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();

            if (stateMachineField.GetValue((AIStateMachineBehaviour)target) != null)
            {
                EditorGUILayout.Space();
                if (GUILayout.Button("Open Graph Editor"))
                    StatesGraph.Open((AIStateMachine)stateMachineField.GetValue(target));
            }

            if (defaultStateField.GetValue((AIStateMachineBehaviour)target) != null)
            {
                EditorGUILayout.Space();
                if (GUILayout.Button("Open Instanced Graph Editor"))
                    StatesGraph.Open((AIState)defaultStateField.GetValue(target), (AIStateMachineBehaviour)target);
            }
        }
    }
}
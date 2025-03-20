using UnityEngine;
using UnityEditor;
using Sirenix.OdinInspector.Editor;

namespace Assets.Scripts.AI.Editor
{
    [CustomEditor(typeof(AIStateMachine))]
    public class AIStateMachineEditor : OdinEditor
    {
        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();
            EditorGUILayout.Space();

            if (GUILayout.Button("Open Editor"))
                StatesGraph.Open((AIStateMachine)target);
        }
    }
}
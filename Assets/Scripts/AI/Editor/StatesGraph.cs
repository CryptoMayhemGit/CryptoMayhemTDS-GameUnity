using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;

namespace Assets.Scripts.AI.Editor
{
    public class StatesGraph : EditorWindow
    {
        private StatesGraphView graphView;

        [MenuItem("Tools/AI State Machine")]
        private static void OpenWindow()
        {
            StatesGraph window = GetWindow<StatesGraph>();
            window.titleContent = new GUIContent("AI State Machine");
            Open(Selection.activeInstanceID, 0);
        }

        [OnOpenAsset(0)]
        public static bool Open(int id, int line)
        {
            if (EditorUtility.InstanceIDToObject(id) is not AIStateMachine)
                return false;

            StatesGraph window = GetWindow<StatesGraph>();
            window.titleContent = new GUIContent("AI State Machine");
            window.graphView = new StatesGraphView((AIStateMachine)EditorUtility.InstanceIDToObject(id));
            window.rootVisualElement.Add(window.graphView);
            return true;
        }

        public static void Open(AIStateMachine target)
        {
            StatesGraph window = GetWindow<StatesGraph>();
            window.titleContent = new GUIContent("AI State Machine");
            window.graphView = new StatesGraphView(target);
            window.rootVisualElement.Add(window.graphView);
        }

        public static void Open(AIState defaultState, AIStateMachineBehaviour behaviour)
        {
            StatesGraph window = GetWindow<StatesGraph>();
            window.titleContent = new GUIContent("AI State Machine");
            window.graphView = new StatesGraphView(defaultState, behaviour);
            window.rootVisualElement.Add(window.graphView);
        }

        private void OnDestroy()
        {
            graphView.SaveExistingData();
            this.rootVisualElement.Clear();
        }
    }
}
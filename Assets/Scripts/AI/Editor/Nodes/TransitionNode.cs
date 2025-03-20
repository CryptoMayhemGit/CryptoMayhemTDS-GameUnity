using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEngine.UIElements;

namespace Assets.Scripts.AI.Editor
{
    public class TransitionNode : AIGraphNode
    {
        public TransitionNode(ScriptableObject parent, Vector2 position, bool isInstancedRuntime)
        {
            this.IsInstancedRuntime = isInstancedRuntime;
            CreateSO<AITransition>(position, parent);

            this.title = "Transition";
            AddSelectionButton();

            UnityEditor.Editor editor = UnityEditor.Editor.CreateEditor(Target);
            this.extensionContainer.Add(new IMGUIContainer(() => editor.OnInspectorGUI()));

            CreateInputPort("In", typeof(StateNode));
            CreateOutputPort("Out", typeof(StateNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(position, Vector2.zero));
        }

        public TransitionNode(AINode target, bool isInstancedRuntime)
        {
            this.Target = target;
            this.IsInstancedRuntime = isInstancedRuntime;

            this.title = "Transition";
            AddSelectionButton();

            UnityEditor.Editor editor = UnityEditor.Editor.CreateEditor(Target);
            this.extensionContainer.Add(new IMGUIContainer(() => editor.OnInspectorGUI()));

            CreateInputPort("In", typeof(StateNode));
            CreateOutputPort("Out", typeof(StateNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(GetNodePosition(target), Vector2.zero));
        }
    }
}
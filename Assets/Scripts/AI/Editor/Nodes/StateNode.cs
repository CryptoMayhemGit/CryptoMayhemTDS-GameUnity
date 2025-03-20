using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor.Experimental.GraphView;

namespace Assets.Scripts.AI.Editor
{
    public class StateNode : AIGraphNode
    {
        public StateNode(ScriptableObject parent, Vector2 position, bool isInstancedRuntime)
        {
            this.IsInstancedRuntime = isInstancedRuntime;
            CreateSO<AIState>(position, parent);

            this.title = "State";
            AddSelectionButton();

            UnityEditor.Editor editor = UnityEditor.Editor.CreateEditor(Target);
            this.extensionContainer.Add(new IMGUIContainer(() => editor.OnInspectorGUI()));

            CreateInputPort("In", typeof(TransitionNode));
            CreateOutputPort("Out", typeof(TransitionNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(position, Vector2.zero));
        }

        public StateNode(AINode target, bool isInstancedRuntime)
        {
            this.Target = target;
            this.IsInstancedRuntime = isInstancedRuntime;

            this.title = "State";
            AddSelectionButton();

            UnityEditor.Editor editor = UnityEditor.Editor.CreateEditor(Target);
            this.extensionContainer.Add(new IMGUIContainer(() => editor.OnInspectorGUI()));

            CreateInputPort("In", typeof(TransitionNode));
            CreateOutputPort("Out", typeof(TransitionNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(GetNodePosition(target), Vector2.zero));
        }

        public override Port GetAvailableOutputPort()
        {
            foreach (Port current in this.outputContainer.Children())
                if (!current.connected)
                    return current;

            CreateOutputPort("Out", typeof(TransitionNode));
            return GetAvailableOutputPort();
        }

        public override void DeleteOutputPort(Port port)
        {
            if (this.outputContainer.childCount > 1)
                this.outputContainer.Remove(port);
        }
    }
}
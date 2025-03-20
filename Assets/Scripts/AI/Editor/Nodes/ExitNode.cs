using Assets.Scripts.AI.Nodes;
using UnityEngine;

namespace Assets.Scripts.AI.Editor
{
    public class ExitNode : AIGraphNode
    {
        public ExitNode(ScriptableObject parent, Vector2 position, bool isInstancedRuntime)
        {
            this.IsInstancedRuntime = isInstancedRuntime;
            CreateSO<AIExit>(position, parent);

            this.title = "Exit";

            CreateInputPort("Result", typeof(TransitionNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(position, Vector2.zero));
        }

        public ExitNode(AINode target, bool isInstancedRuntime)
        {
            this.Target = target;
            this.IsInstancedRuntime = isInstancedRuntime;

            this.title = "Exit";

            CreateInputPort("Result", typeof(TransitionNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(GetNodePosition(target), Vector2.zero));
        }
    }
}
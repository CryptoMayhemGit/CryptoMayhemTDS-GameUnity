using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEditor.Experimental.GraphView;

namespace Assets.Scripts.AI.Editor
{
    public class StartNode : AIGraphNode
    {
        public StartNode(ScriptableObject parent, Vector2 position, bool isInstancedRuntime)
        {
            this.IsInstancedRuntime = isInstancedRuntime;
            CreateSO<AIStart>(position, parent);

            this.title = "Start";
            this.capabilities &= ~Capabilities.Movable;
            this.capabilities &= ~Capabilities.Deletable;

            CreateOutputPort("Default State", typeof(StateNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(position, Vector2.zero));
        }

        public StartNode(AINode target, bool isInstancedRuntime)
        {
            this.Target = target;
            this.IsInstancedRuntime = isInstancedRuntime;

            this.title = "Start";
            this.capabilities &= ~Capabilities.Movable;
            this.capabilities &= ~Capabilities.Deletable;

            CreateOutputPort("Default State", typeof(StateNode));
            RefreshExpandedState();
            RefreshPorts();

            SetPosition(new Rect(GetNodePosition(target), Vector2.zero));
        }
    }
}
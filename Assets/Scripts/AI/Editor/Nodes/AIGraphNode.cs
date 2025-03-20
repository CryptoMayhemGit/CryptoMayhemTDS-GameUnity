using System.Reflection;
using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor;
using UnityEditor.Experimental.GraphView;

namespace Assets.Scripts.AI.Editor
{
    public abstract class AIGraphNode : Node
    {
        [field: SerializeField] public AINode Target { get; protected set; } = null;
        [field: SerializeField] public bool IsInstancedRuntime { get; protected set; } = false;

        public virtual void AddSelectionButton()
        {
            this.titleContainer.Add(new Button(() => Selection.activeObject = Target) { text = "Select" });
        }

        public virtual void CreateInputPort(string name, System.Type portType)
        {
            Port port = InstantiatePort(Orientation.Horizontal, Direction.Input, Port.Capacity.Single, portType);
            port.portName = name;
            this.inputContainer.Add(port);
        }

        public virtual void CreateOutputPort(string name, System.Type portType)
        {
            Port port = InstantiatePort(Orientation.Horizontal, Direction.Output, Port.Capacity.Single, portType);
            port.portName = name;
            this.outputContainer.Add(port);
        }

        public virtual void DeleteOutputPort(Port port)
        {
            this.outputContainer.Remove(port);
        }

        public virtual Port GetAvailableOutputPort()
        {
            foreach (Port current in this.outputContainer.Children())
                if (!current.connected)
                    return current;

            return null;
        }

        public virtual Port GetAvailableInputPort()
        {
            foreach (Port current in this.inputContainer.Children())
                if (!current.connected)
                    return current;

            return null;
        }

        public virtual void CreateSO<T>(Vector2 position, ScriptableObject parent) where T : AINode
        {
            Target = ScriptableObject.CreateInstance<T>();
            if (Target is not AIStart)
                Undo.RegisterCreatedObjectUndo(Target, "(AI State Machine) Add Node");

            this.Target.name = Target.GetType().Name;
            this.Target.SetNodePosition(position);

            if (IsInstancedRuntime)
                return;

            AssetDatabase.AddObjectToAsset(Target, parent);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        public virtual void DeleteSO()
        {
            if (IsInstancedRuntime)
                return;

            Object loaded = AssetDatabase.LoadAssetAtPath(AssetDatabase.GetAssetPath(Target), Target.GetType());
            if (loaded == null)
                return;

            Undo.RegisterCompleteObjectUndo(Target, "(AI State Machine) Delete Node");
            AssetDatabase.RemoveObjectFromAsset(loaded);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        public virtual Vector3 GetNodePosition(AINode node)
        {
            FieldInfo positionField = (typeof(AINode).GetField("nodePosition", BindingFlags.Instance | BindingFlags.NonPublic));
            return (Vector3)positionField.GetValue(node);
        }

        public override void UpdatePresenterPosition()
        {
            Undo.RecordObject(Target, "(AI State Machine) Change Position");
            base.UpdatePresenterPosition();
            Target.SetNodePosition(GetPosition().position);
        }
    }
}
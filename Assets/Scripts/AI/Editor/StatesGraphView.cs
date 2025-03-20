using System.Linq;
using System.Reflection;
using System.Collections.Generic;
using Assets.Scripts.AI.Nodes;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEditor;
using UnityEditor.UIElements;
using UnityEditor.Experimental.GraphView;

namespace Assets.Scripts.AI.Editor
{
    public class StatesGraphView : GraphView
    {
        private readonly AIStateMachine target;
        private readonly AIStateMachineBehaviour targetBehaviour;
        private readonly AIState defaultRuntimeState;

        private bool IsRuntime => targetBehaviour != null;

        public StatesGraphView(AIStateMachine stateMachine)
        {
            target = stateMachine;

            this.StretchToParentSize();
            this.AddManipulator(new ContentZoomer());
            this.AddManipulator(new ContentDragger());
            this.AddManipulator(new SelectionDragger());
            this.AddManipulator(new RectangleSelector());

            GridBackground grid = new GridBackground();
            Add(grid);
            grid.SendToBack();
            grid.StretchToParentSize();
            GenerateToolbar();
            RefreshRootView();

            Undo.undoRedoPerformed += OnUndoRedoPerformed;
        }

        public StatesGraphView(AIState defaultState, AIStateMachineBehaviour stateMachineBehaviour)
        {
            defaultRuntimeState = defaultState;
            targetBehaviour = stateMachineBehaviour;

            this.StretchToParentSize();
            this.AddManipulator(new ContentZoomer());
            this.AddManipulator(new ContentDragger());
            this.AddManipulator(new SelectionDragger());
            this.AddManipulator(new RectangleSelector());

            GridBackground grid = new GridBackground();
            Add(grid);
            grid.SendToBack();
            grid.StretchToParentSize();
            GenerateToolbar();
            RefreshRootView();
        }

        public override void BuildContextualMenu(ContextualMenuPopulateEvent evt)
        {
            if (IsRuntime)
                return;

            Vector2 mousePosition = this.viewTransform.matrix.inverse.MultiplyPoint(evt.localMousePosition);
            evt.menu.AppendAction("State", (e) => AddElement(new StateNode(target, mousePosition, IsRuntime)));
            evt.menu.AppendAction("Transition", (e) => AddElement(new TransitionNode(target, mousePosition, IsRuntime)));
            evt.menu.AppendAction("Exit", (e) => AddElement(new ExitNode(target, mousePosition, IsRuntime)));
        }

        public override List<Port> GetCompatiblePorts(Port startPort, NodeAdapter nodeAdapter)
        {
            return ports.Where((port) => startPort != port
                                         && startPort.direction != port.direction
                                         && startPort.node != port.node
                                         && startPort.portType != port.portType)
                                         .ToList();
        }

        public void SaveExistingData()
        {
            if (IsRuntime)
            {
                targetBehaviour.OnCurrentStateChanged -= SetCurrentStateBackgroundColor;
                return;
            }

            Undo.undoRedoPerformed -= OnUndoRedoPerformed;
            SetGraphView();

            foreach (Node current in nodes)
            {
                ((AIGraphNode)current).Target.SetNodePosition(current.GetPosition().position);

                if (current is StartNode startNode && startNode.Target.Outputs.Count > 0)
                    SetDefaultState((AIState)startNode.Target.Outputs[0]);
            }

            EditorUtility.SetDirty(target);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        private void OnUndoRedoPerformed()
        {
            this.graphViewChanged -= OnGraphViewChange;
            SetGraphView();
            EditorUtility.SetDirty(target);
            AssetDatabase.SaveAssets();
            DeleteElements(graphElements);
            RefreshRootView();
        }

        private void SetGraphView()
        {
            FieldInfo positionField = GetFieldInfo(typeof(AIStateMachine), "viewPosition");
            FieldInfo scaleField = GetFieldInfo(typeof(AIStateMachine), "viewScale");
            positionField.SetValue(target, viewTransform.position);
            scaleField.SetValue(target, viewTransform.scale);
        }

        private (Vector3 position, Vector3 scale) GetGraphView(AIStateMachine getFrom)
        {
            FieldInfo positionField = GetFieldInfo(typeof(AIStateMachine), "viewPosition");
            FieldInfo scaleField = GetFieldInfo(typeof(AIStateMachine), "viewScale");
            return ((Vector3)positionField.GetValue(getFrom), (Vector3)scaleField.GetValue(getFrom));
        }

        private void SetDefaultState(AIState state)
        {
            FieldInfo stateField = GetFieldInfo(typeof(AIStateMachine), "defaultState");
            stateField.SetValue(target, state);
        }

        private void RefreshRootView()
        {
            if (IsRuntime)
            {
                LoadRuntimeSOs(defaultRuntimeState);
                targetBehaviour.OnCurrentStateChanged += SetCurrentStateBackgroundColor;
                FieldInfo currentStateField = GetFieldInfo(typeof(AIStateMachineBehaviour), "currentState");
                SetCurrentStateBackgroundColor(null, (AIState)currentStateField.GetValue(targetBehaviour));
            }
            else
            {
                LoadExistingSOs();
            }

            CreateStartNode();

            this.graphViewChanged += OnGraphViewChange;
        }

        private FieldInfo GetFieldInfo(System.Type type, string variableName)
        {
            return (type.GetField(variableName, BindingFlags.Instance | BindingFlags.NonPublic));
        }

        private void SetCurrentStateBackgroundColor(AIState previous, AIState current)
        {
            StateNode currentNode = nodes.Where(x => ((AIGraphNode)x).Target == current).FirstOrDefault() as StateNode;

            if (previous != null)
            {
                StateNode previousNode = nodes.Where(x => ((AIGraphNode)x).Target == previous).FirstOrDefault() as StateNode;
                previousNode.titleContainer.style.backgroundColor = currentNode.titleContainer.style.backgroundColor;
            }

            currentNode.titleContainer.style.backgroundColor = new Color(0.15f, 0.48f, 0.13f, 0.8f);
        }

        private void GenerateToolbar()
        {
            Toolbar toolbar = new Toolbar();
            Add(toolbar);

            Label nameLabel = new Label(IsRuntime ? "Instanced AI State Machine" : $"Name: {target.name}");
            toolbar.Add(nameLabel);
            nameLabel.style.unityTextAlign = TextAnchor.MiddleCenter;
            nameLabel.StretchToParentSize();
        }

        private void CreateStartNode()
        {
            if (IsRuntime)
            {
                StartNode runtimeStart = new StartNode(null, Vector2.zero, IsRuntime);
                runtimeStart.Target.AddOutputNode(defaultRuntimeState);
                CreateEdgesForGraphNode(runtimeStart);
                AddElement(runtimeStart);
                return;
            }

            if (nodes.Any(x => x.GetType() == typeof(StartNode)))
                return;

            StartNode newStart = new StartNode(target, Vector2.zero, IsRuntime);
            if (target.GetDefaultState != null)
            {
                newStart.Target.AddOutputNode(target.GetDefaultState);
                CreateEdgesForGraphNode(newStart);
            }

            AddElement(newStart);
        }

        private void LoadRuntimeSOs(AINode toLoad)
        {
            AIGraphNode loaded = LoadSingleGraphNode(toLoad);
            AddElement(loaded);

            foreach (AINode output in toLoad.Outputs)
                LoadRuntimeSOs(output);

            if (toLoad.Outputs.Count <= 0)
                return;

            CreateEdgesForGraphNode(loaded);
        }

        private void LoadExistingSOs()
        {
            Object[] loaded = AssetDatabase.LoadAllAssetsAtPath(AssetDatabase.GetAssetPath(target));
            if (loaded.Length <= 0)
                return;

            foreach (Object current in loaded)
                if (current is AIStateMachine aiStateMachine)
                    UpdateViewTransform(GetGraphView(aiStateMachine).position, GetGraphView(aiStateMachine).scale);
                else
                    AddElement(LoadSingleGraphNode((AINode)current));

            foreach (Node current in nodes)
                if (current is AIGraphNode aiGraphNode && aiGraphNode.Target.Outputs.Count > 0)
                    CreateEdgesForGraphNode(aiGraphNode);
        }

        private AIGraphNode LoadSingleGraphNode(AINode node)
        {
            switch (node)
            {
                case AITransition _:
                    return new TransitionNode(node as AITransition, IsRuntime);
                case AIState _:
                    return new StateNode(node as AIState, IsRuntime);
                case AIStart _:
                    return new StartNode(node as AIStart, IsRuntime);
                case AIExit _:
                    return new ExitNode(node as AIExit, IsRuntime);
                default:
                    return null;
            }
        }

        private void CreateEdgesForGraphNode(AIGraphNode node)
        {
            foreach (Node relative in nodes)
            {
                foreach (AINode output in node.Target.Outputs)
                {
                    if (((AIGraphNode)relative).Target == output)
                    {
                        Port inputPort = ((AIGraphNode)relative).GetAvailableInputPort();
                        Port outputPort = node.GetAvailableOutputPort();
                        Edge newEdge = inputPort.ConnectTo(outputPort);
                        AddElement(newEdge);

                        if (node is StateNode stateNode)
                            stateNode.CreateOutputPort("Out", typeof(TransitionNode));
                    }
                }
            }
        }

        private GraphViewChange OnGraphViewChange(GraphViewChange graphViewChange)
        {
            graphViewChange = ElementsToRemove(graphViewChange);
            graphViewChange = EdgesToCreate(graphViewChange);
            return graphViewChange;
        }

        private GraphViewChange ElementsToRemove(GraphViewChange graph)
        {
            if (graph.elementsToRemove == null)
                return graph;

            foreach (GraphElement element in graph.elementsToRemove)
            {
                if (element is AIGraphNode graphNode)
                    graphNode.DeleteSO();

                if (element is Edge edge)
                {
                    ((AIGraphNode)edge.output.node).Target.RemoveOutputNode(((AIGraphNode)edge.input.node).Target);
                    edge.output.DisconnectAll();
                    edge.input.DisconnectAll();

                    if (edge.output.node is StateNode stateNode)
                        stateNode.DeleteOutputPort(edge.output);
                }
            }

            return graph;
        }

        private GraphViewChange EdgesToCreate(GraphViewChange graph)
        {
            if (graph.edgesToCreate == null)
                return graph;

            foreach (Edge edge in graph.edgesToCreate)
            {
                if (edge.input.node is AIGraphNode aiGraphNode)
                    ((AIGraphNode)edge.output.node).Target.AddOutputNode(aiGraphNode.Target);

                if (edge.input.node is TransitionNode)
                    ((AIGraphNode)edge.output.node).CreateOutputPort("Out", typeof(TransitionNode));
            }

            return graph;
        }
    }
}
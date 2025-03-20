using Assets.Scripts.Containers;
using Pathfinding;
using Sirenix.OdinInspector.Editor;
using Sirenix.Utilities.Editor;
using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Assets.Scripts.Editor
{
    public class DebugWindow : OdinMenuEditorWindow
    {
        private readonly Type[] ignore = { typeof(Transform), typeof(Rigidbody), typeof(BoxCollider), typeof(PlayerContainer), typeof(EnemyContainer), typeof(Input.PlayerInput), typeof(StateMachine.PlayerStateMachine), typeof(Pathfinding.RVO.RVOController), typeof(FunnelModifier), typeof(Seeker), typeof(RichAI), typeof(SimpleSmoothModifier), typeof(Effects.CharacterEffects),  typeof(Stats.StatValueSetter), typeof(OnTriggerEnterCaller), typeof(OnTriggerExitCaller) };

        [MenuItem("Tools/Debug Window")]
        private static void OpenWindow()
        {
            GetWindow<DebugWindow>().Show();
        }

        protected override void OnBeginDrawEditors()
        {
            SirenixEditorGUI.BeginHorizontalToolbar();
            GUILayout.FlexibleSpace();

            if (SirenixEditorGUI.ToolbarButton("Refresh") && EditorApplication.isPlaying)
                UnityEngine.SceneManagement.SceneManager.LoadScene(0);

            SirenixEditorGUI.EndHorizontalToolbar();
        }

        protected override OdinMenuTree BuildMenuTree()
        {
            var tree = new OdinMenuTree();
                       
            AddPrefabsComponents(tree, "Player", ignore);
            tree.AddAllAssetsAtPath("Movement", "Assets/Data/Movement Types");
            tree.AddAllAssetsAtPath("Weapons Melee", "Assets/Data/Inventory/Weapons/Melee");
            tree.AddAllAssetsAtPath("Weapons Range", "Assets/Data/Inventory/Weapons/Range");
            tree.AddAllAssetsAtPath("Utility Items", "Assets/Data/UtilityItems");
            tree.AddAllAssetsAtPath("Effects", "Assets/Data/Effects");
            AddPrefabsComponents(tree, "Enemy", ignore);
            AddPrefabsComponents(tree, "OffensiveItems", ignore);

            return tree;
        }

        private void AddPrefabsComponents(OdinMenuTree tree, string folderName, Type[] ignoreTypes)
        {
            foreach (var prefab in FindPrefabs(folderName))
                foreach (var component in prefab.GetComponents<Component>())
                    if (!ignoreTypes.Contains(component.GetType()))
                        tree.Add(folderName + "/" + prefab.name + "/" + component.GetType().Name, component);
        }

        private System.Collections.Generic.IEnumerable<GameObject> FindPrefabs(string guid)
        {
            return AssetDatabase.FindAssets("t: Prefab", new[] { "Assets/Prefabs/" + guid })
                .Select(x => AssetDatabase.GUIDToAssetPath(x))
                .Select(x => AssetDatabase.LoadAssetAtPath<GameObject>(x));
        }
    }
}
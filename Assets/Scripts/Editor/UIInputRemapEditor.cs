using UnityEngine;
using UnityEngine.InputSystem;
using UnityEditor;

namespace Assets.Scripts.Editor
{
    [CustomEditor(typeof(UI.Input.UIInputRemap))]
    public class UIInputRemapEditor : UnityEditor.Editor
    {
        private SerializedProperty startRebind;
        private SerializedProperty text;
        private SerializedProperty input;
        private SerializedProperty controlIndex;
        private SerializedProperty bindingIndex;

        private void OnEnable()
        {
            startRebind = serializedObject.FindProperty("startRebind");
            text = serializedObject.FindProperty("text");
            input = serializedObject.FindProperty("targetInput");
            controlIndex = serializedObject.FindProperty("controlIndex");
            bindingIndex = serializedObject.FindProperty("bindingIndex");
        }

        public override void OnInspectorGUI()
        {
            EditorGUI.BeginChangeCheck();

            EditorGUILayout.PropertyField(startRebind);
            EditorGUILayout.PropertyField(text);

            if (EditorGUI.EndChangeCheck())
                serializedObject.ApplyModifiedProperties();

            EditorGUI.BeginChangeCheck();

            EditorGUILayout.PropertyField(input);

            if (input.objectReferenceValue != null && ((InputActionReference)input.objectReferenceValue).action.bindings[0].isComposite)
                EditorGUILayout.IntSlider(controlIndex, 0, ((InputActionReference)input.objectReferenceValue).action.controls.Count - 1);

            if (EditorGUI.EndChangeCheck())
            {
                UpdateBindingIndex();
                serializedObject.ApplyModifiedProperties();
            }

            GUI.enabled = false;
            EditorGUILayout.PropertyField(bindingIndex);
            GUI.enabled = true;
        }

        private void UpdateBindingIndex()
        {
            var action = ((InputActionReference)input.objectReferenceValue).action;
            bindingIndex.intValue = action.GetBindingIndexForControl(action.controls[controlIndex.intValue]);
        }
    }
}
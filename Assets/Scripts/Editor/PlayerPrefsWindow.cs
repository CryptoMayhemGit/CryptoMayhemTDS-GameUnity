using Microsoft.Win32;
using System;
using System.Linq;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Assets.Scripts.Editor
{
    public class PlayerPrefsWindow : EditorWindow
    {
        private readonly Type[] TYPES = { typeof(string), typeof(float), typeof(int) };
        
        private RegistryKey registryKey;
        private Vector2 scrollViewPosition;
        private List<(string Key, string Value, Type ValueType)> prefs;
        private (string Key, string Value, Type ValueType) prefsToAdd;
        private int selectedIndexOfType;

        [MenuItem("Tools/Player Prefs")]
        private static void OpenWindow()
        {
            PlayerPrefsWindow window = GetWindow<PlayerPrefsWindow>();
            window.titleContent = new GUIContent("Player Prefs");
            window.Show();
        }

        private void OnEnable()
        {
            SearchForPlayerPrefsInWindowsOS();
            prefsToAdd = new("Key", "Value", typeof(string));
        }

        private void OnGUI()
        {
            scrollViewPosition = EditorGUILayout.BeginScrollView(scrollViewPosition);
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.BeginVertical();
            EditorGUILayout.LabelField("Key", EditorStyles.whiteLargeLabel, GUILayout.Height(24f));
            foreach (var item in prefs)
                EditorGUILayout.LabelField(item.Key, GUILayout.Height(20f));
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical();
            EditorGUILayout.LabelField("Value", EditorStyles.whiteLargeLabel, GUILayout.Height(24f));
            foreach (var item in prefs)
                EditorGUILayout.LabelField(item.Value.ToString(), GUILayout.Height(20f));
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical();
            EditorGUILayout.LabelField("Action", EditorStyles.whiteLargeLabel, GUILayout.Height(24f));
            foreach (var item in prefs)
            {
                EditorGUILayout.BeginHorizontal();
                if (GUILayout.Button("Remove", GUILayout.Height(20f)))
                    RemoveKey(item.Key);

                if (GUILayout.Button("Copy", GUILayout.Height(20f)))
                {
                    prefsToAdd = item;
                    selectedIndexOfType = Array.IndexOf(TYPES, prefsToAdd.ValueType);
                }
                EditorGUILayout.EndHorizontal();
            }
            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndScrollView();

            EditorGUILayout.BeginHorizontal();

            prefsToAdd.Key = EditorGUILayout.TextField(prefsToAdd.Key);

            if (TYPES[selectedIndexOfType] == typeof(string))
            {
                prefsToAdd.Value = EditorGUILayout.TextField(prefsToAdd.Value.ToString());
            }
            else if (TYPES[selectedIndexOfType] == typeof(float))
            {
                if (!float.TryParse(prefsToAdd.Value, out float result))
                    prefsToAdd.Value = "0";
                prefsToAdd.Value = EditorGUILayout.FloatField(float.Parse(prefsToAdd.Value)).ToString();
            }
            else if (TYPES[selectedIndexOfType] == typeof(int))
            {
                if (!int.TryParse(prefsToAdd.Value, out int result))
                    prefsToAdd.Value = "0";
                prefsToAdd.Value = EditorGUILayout.IntField(int.Parse(prefsToAdd.Value)).ToString();
            }

            selectedIndexOfType = EditorGUILayout.Popup(selectedIndexOfType, TYPES.Select(x => x.ToString()).ToArray());

            if (GUILayout.Button("Add/Modify Prefs"))
                AddOrModifyPlayerPrefs();

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.Space();
            if (GUILayout.Button("Remove All", GUILayout.Height(24f)))
                PlayerPrefs.DeleteAll();

            if (GUILayout.Button("Refresh", GUILayout.Height(24f)))
                SearchForPlayerPrefsInWindowsOS();
        }

        private void SearchForPlayerPrefsInWindowsOS()
        {
            if (Application.platform is not RuntimePlatform.WindowsEditor)
                return;

            registryKey = Registry.CurrentUser.OpenSubKey($"Software\\Unity\\UnityEditor\\{PlayerSettings.companyName}\\{PlayerSettings.productName}");
            prefs = new List<(string Key, string Value, Type ValueType)>();
            string[] keys = registryKey.GetValueNames();

            for (int i = 0; i < keys.Length; i++)
                prefs.Add(GetPlayerPrefsFromKey(keys[i]));
        }

        private (string Key, string Value, Type ValueType) GetPlayerPrefsFromKey(string key)
        {
            object value = registryKey.GetValue(key);

            if (value.GetType() == typeof(byte[]))
                return (key, PlayerPrefs.GetString(key), typeof(string));

            else if (PlayerPrefs.GetInt(key, -1) == -1 && PlayerPrefs.GetInt(key, 1) == 1)
                return (key, PlayerPrefs.GetFloat(key).ToString(), typeof(float));

            else if (value.GetType() == typeof(int))
                return (key, PlayerPrefs.GetInt(key).ToString(), typeof(int));

            return ("None", "None", null);
        }

        private void RemoveKey(string key)
        {
            PlayerPrefs.DeleteKey(key);
            SearchForPlayerPrefsInWindowsOS();
        }

        private void AddOrModifyPlayerPrefs()
        {
            if (!PlayerPrefs.HasKey(prefsToAdd.Key))
                prefsToAdd.ValueType = TYPES[selectedIndexOfType];

            if (prefsToAdd.ValueType == typeof(string))
                PlayerPrefs.SetString(prefsToAdd.Key, prefsToAdd.Value);

            else if (prefsToAdd.ValueType == typeof(float))
                PlayerPrefs.SetFloat(prefsToAdd.Key, float.Parse(prefsToAdd.Value));

            else if (prefsToAdd.ValueType == typeof(int))
                PlayerPrefs.SetInt(prefsToAdd.Key, int.Parse(prefsToAdd.Value));

            PlayerPrefs.Save();
            SearchForPlayerPrefsInWindowsOS();
        }
    }
}
using Assets.Scripts.Containers;
using Assets.Scripts.Effects;
using Assets.Scripts.Stats;
using Assets.Scripts.Damage;
using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace Assets.Scripts.Editor
{
    public class CheatWindow : EditorWindow
    {
        private List<StatType> statTypes;
        private List<Effect> effects;
        private List<DamageType> damageTypes;
        private CharacterContainer character;
        private Dictionary<StatType, DynamicStat> dynamicStats;
        private Dictionary<StatType, Stat> stats;
        private float damageAmount;
        private int selectedDamageType;
        private int selectedStatToModifire;
        private float valueToModifire;
        private int selectedEffect;
        private Vector2 scrollViewPosition = Vector2.zero;

        [MenuItem("Tools/Cheat Window")]
        private static void OpenWindow()
        {
            CheatWindow cheatWindow = GetWindow<CheatWindow>();
            cheatWindow.titleContent = new GUIContent("Cheat Window");
            cheatWindow.Show();
        }

        private void Init()
        {
            character =
              (Selection.activeGameObject is not null &&
              Selection.activeGameObject.TryGetComponent<CharacterContainer>(out var container)) ?
              container : null;

            if (character is null)
                return;

            dynamicStats = typeof(CharacterStats).GetField("dynamicStats", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(character.Stats) as Dictionary<StatType, DynamicStat>;
            stats = typeof(CharacterStats).GetField("stats", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(character.Stats) as Dictionary<StatType, Stat>;
        }

        private void OnEnable()
        {
            statTypes = FindAllScriptableObjects<StatType>().ToList();
            effects = FindAllScriptableObjects<Effect>().ToList();
            damageTypes = FindAllScriptableObjects<DamageType>().ToList();

            EditorApplication.playModeStateChanged += InitOnPlayMode;
        }

        private void OnDisable() => EditorApplication.playModeStateChanged -= InitOnPlayMode;
        private void OnSelectionChange() => Init();

        private void OnInspectorUpdate()
        {
            if (Application.isPlaying)
                Repaint();
        }

        private void OnGUI()
        {
            if (!Application.isPlaying || character == null)
                return;

            scrollViewPosition = EditorGUILayout.BeginScrollView(scrollViewPosition);

            EditorGUILayout.LabelField(character.name, EditorStyles.boldLabel);

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Dynamics Stats", EditorStyles.boldLabel);

            foreach (var item in dynamicStats)
                EditorGUILayout.LabelField(item.Key.name, item.Value.DynamicValue.ToString());

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Stats", EditorStyles.boldLabel);

            foreach (var item in stats)
                EditorGUILayout.LabelField(item.Key.name, item.Value.Value.ToString());

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Damages", EditorStyles.boldLabel);

            selectedDamageType = EditorGUILayout.Popup("Damage Type", selectedDamageType, damageTypes.Select(x => x.name).ToArray());

            EditorGUILayout.BeginHorizontal();
            damageAmount = EditorGUILayout.FloatField("Damage", damageAmount);

            if (GUILayout.Button("Give Damage"))
                character.Health.DealDamage(damageTypes[selectedDamageType], damageAmount);

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Modifiers", EditorStyles.boldLabel);

            EditorGUILayout.BeginHorizontal();
            selectedStatToModifire = EditorGUILayout.Popup(selectedStatToModifire, statTypes.Select(x => x.name).ToArray());
            valueToModifire = EditorGUILayout.FloatField(valueToModifire);

            if (GUILayout.Button("Modifire flat"))
                ApplyModifire(0);

            if (GUILayout.Button("Modifire percent"))
                ApplyModifire(1);

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Effects", EditorStyles.boldLabel);

            EditorGUILayout.BeginHorizontal();
            selectedEffect = EditorGUILayout.Popup(selectedEffect, effects.Select(x => x.name).ToArray());
            if (GUILayout.Button("Add"))
                character.Effects.AddEffect(effects[selectedEffect]);
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.Space();

            object dictionary = typeof(CharacterEffects).GetField("effects", BindingFlags.Instance | BindingFlags.NonPublic).GetValue(character.Effects);
            System.Type dictionaryType = dictionary.GetType();
            ReadOnlyCollection<Effect> characterEffects = dictionaryType.GetProperty("Keys").GetValue(dictionary, null) as ReadOnlyCollection<Effect>;
            IList characterEffectsInstances = dictionaryType.GetProperty("Values").GetValue(dictionary, null) as IList;

            for (int i = 0; i < characterEffects.Count; i++)
                AddEffectToWindow(i, characterEffects, characterEffectsInstances);

            EditorGUILayout.EndScrollView();
        }

        private void InitOnPlayMode(PlayModeStateChange obj)
        {
            if (obj == PlayModeStateChange.EnteredPlayMode)
                Init();
        }

        private IEnumerable<T> FindAllScriptableObjects<T>() where T : Object
        {
            return AssetDatabase.FindAssets("t:" + typeof(T).Name)
                .Select(x => AssetDatabase.GUIDToAssetPath(x))
                .Select(x => AssetDatabase.LoadAssetAtPath<T>(x));
        }

        private void ApplyModifire(int flatOrPercentage)
        {
            StatModifier newModifier = new();
            FieldInfo modifierType = typeof(StatModifier).GetField("type", BindingFlags.Instance | BindingFlags.NonPublic);
            FieldInfo modifierStat = typeof(StatModifier).GetField("stat", BindingFlags.Instance | BindingFlags.NonPublic);
            FieldInfo modifierValue = typeof(StatModifier).GetField("value", BindingFlags.Instance | BindingFlags.NonPublic);

            modifierType.SetValue(newModifier, flatOrPercentage);
            modifierStat.SetValue(newModifier, statTypes[selectedStatToModifire]);
            modifierValue.SetValue(newModifier, valueToModifire);

            newModifier.Apply(character.Stats);
        }

        private void AddEffectToWindow(int effectIndex, ReadOnlyCollection<Effect> characterEffects, IList characterEffectsInstances)
        {
            EditorGUILayout.LabelField("Name", characterEffects[effectIndex].name);

            System.Type instanceType = characterEffectsInstances[effectIndex].GetType();

            FieldInfo instanceTickTime = instanceType.GetField("tickTime", BindingFlags.Instance | BindingFlags.NonPublic);
            EditorGUILayout.LabelField("Instance Tick Time", instanceTickTime.GetValue(characterEffectsInstances[effectIndex]).ToString());

            FieldInfo instanceTicks = instanceType.GetField("ticks", BindingFlags.Instance | BindingFlags.NonPublic);
            EditorGUILayout.LabelField("Instance Ticks", instanceTicks.GetValue(characterEffectsInstances[effectIndex]).ToString());

            if (GUILayout.Button("Remove"))
                character.Effects.RemoveEffect(characterEffects[effectIndex]);

            EditorGUILayout.Space();
        }
    }
}
using System;
using Culling;
using Extensions;
using JetBrains.Annotations;
using UnityEditor.Build;
using UnityEditor.Build.Reporting;
using UnityEngine;
using UnityEngine.SceneManagement;


    public sealed class CullingScenePostprocessor: IProcessSceneWithReport
    {
        /// <inheritdoc />
        public int callbackOrder => 20;

        /// <inheritdoc />
        public void OnProcessScene(Scene scene, BuildReport report)
        {
            SpawnCullingInstance(scene, CullingType.Default);
        }

        [CanBeNull]
        private static SceneCullingInstance SpawnCullingInstance(Scene scene, CullingType cullingType)
        {
            if (!scene.IsValid()) throw new ArgumentException("Value should be valid.", nameof(scene));

            var instances = scene.GetComponentsOfType<SceneCullingInstance>(true);
            for (var index0 = 0; index0 < instances.Length; index0++)
            {
                var i = instances[index0];
                if (i.type == cullingType)
                    return i;
            }

            var obj = new GameObject("SCENE_CULLING (GENERATED)");
            SceneManager.MoveGameObjectToScene(obj, scene);
            obj.transform.SetAsFirstSibling();
            obj.SetActive(false);

            var instance = obj.AddComponent<SceneCullingInstance>();
            instance.type = cullingType;
            if (!instance.ApplySceneSizeFromPlayZone())
            {
                instance.ApplySceneSizeAll();
            }
            obj.SetActive(true);
            return instance;
        }
    }
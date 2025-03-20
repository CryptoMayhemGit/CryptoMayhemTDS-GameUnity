using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Extensions
{
    /// <summary>
    ///     Set of utility methods: <see cref="Scene"/>
    /// </summary>
    public static class ExtensionScene
    {
        /// <summary>
        ///     Returns component of given type.
        /// </summary>
        /// <remarks>
        ///     Search for component from all root gameObjects of active scene.
        ///     This includes inactive root objects.
        /// </remarks>
        [CanBeNull]
        public static T GetComponentOfType<T>(this Scene scene, in bool includeInactive = false) where T : Component
        {
            if (!scene.IsValid()) throw new ArgumentException("Value should be valid.", nameof(scene));
            var rootObjects = scene.GetRootGameObjects();
            for (var index = 0; index < rootObjects.Length; index++)
            {
                var component = rootObjects[index].GetComponentInChildren<T>(includeInactive);
                if (component != null)
                    return component;
            }

            return default;
        }
        
        /// <summary>
        ///     Returns collection of components of given type.
        /// </summary>
        /// <remarks>
        ///     Search for components from all root gameObjects of active scene.
        ///     This includes inactive root objects.
        /// </remarks>
        [NotNull, ItemNotNull]
        public static T[] GetComponentsOfType<T>(this Scene scene, in bool includeInactive = false) where T : Component
        {
            if (!scene.IsValid()) throw new ArgumentException("Value should be valid.", nameof(scene));
            var components = new List<T>();
            var rootObjects = scene.GetRootGameObjects();
            for (var index = 0; index < rootObjects.Length; index++)
                components.AddRange(rootObjects[index].GetComponentsInChildren<T>(includeInactive));

            return components.ToArray();
        }
        
        public static void GetComponentsOfType<T>(this Scene scene, List<T> list, in bool includeInactive = false) where T : Component
        {
            if (!scene.IsValid()) throw new ArgumentException("Value should be valid.", nameof(scene));
            var rootObjects = scene.GetRootGameObjects();
            for (var index = 0; index < rootObjects.Length; index++)
                list.AddRange(rootObjects[index].GetComponentsInChildren<T>(includeInactive));
        }
        
        /// <summary>
        ///     Gets all <typeparamref name="T"/> implemented scripts from the scene.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplemented<T>(this Scene scene, in bool includeInactive = false) where T : class
        {
            if (scene == null) throw new ArgumentNullException(nameof(scene));
            if (!scene.IsValid()) throw new ArgumentException("Cannot get components implemented; Unity scene is invalid.", nameof (scene));
            var components = new List<T>();
            var rootObjects = scene.GetRootGameObjects();
            for (var index = 0; index < rootObjects.Length; index++)
                components.AddRange(rootObjects[index].GetComponentsImplementedInChildren<T>(includeInactive));

            return components;
        }
    }
}
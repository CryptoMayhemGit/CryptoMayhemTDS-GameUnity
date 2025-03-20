using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using UnityEngine;

namespace Extensions
{
    /// <summary>
    ///     Set of utility methods: <see cref="GameObject"/>
    /// </summary>
    public static class ExtensionGameObject
    {
        public static GameObject Find([NotNull] this GameObject go, params string[] paths)
        {
            if (go == null) throw new ArgumentNullException(nameof(go));
            for (var index0 = 0; index0 < paths.Length; index0++)
            {
                var t = go.transform.Find(paths[index0]);
                if (t == null)
                    continue;
                return t.gameObject;
            }

            return null;
        }
        
        /// <summary>
        ///     Invoke operation on all children components of the GameObject.
        /// </summary>
        /// <param name="gameObject">Parent of GameObjects.</param>
        /// <param name="operation">Operation to invoke.</param>
        /// <exception cref="ArgumentNullException"/>
        public static void ForEachChild<T1>([NotNull] this GameObject gameObject, [NotNull] Action<T1> operation)
            where T1 : Component
        {
            if (gameObject == null) throw new ArgumentNullException(nameof(gameObject));
            if (operation == null) throw new ArgumentNullException(nameof(operation));

            var elements = gameObject.GetComponentsInChildren<T1>();
            foreach (var e in elements)
                operation.Invoke(e);
        }

        /// <summary>
        ///     Creates new GameObject as a child of your target.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static GameObject CreateChild([NotNull] this GameObject go, [NotNull] string childName)
        {
            if (go == null) throw new ArgumentNullException(nameof(go));
            if (childName == null) throw new ArgumentNullException(nameof(childName));
            var child = new GameObject(childName);
            child.transform.SetParent(go.transform);
            child.transform.ResetLocalTransform();
            return child;
        }
        
        /// <summary>
        ///     Gets path from grand parent to target gameObject.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static string GetParentPath([NotNull] this GameObject go, bool includeSiblingIndex = false)
        {
            if (go == null) throw new ArgumentNullException(nameof(go));
            return go.transform.GetParentPath(includeSiblingIndex);
        }

        public static bool HasParentOfName([NotNull] this GameObject go, [NotNull] string parentName,
            in bool contains = false)
        {
            if (go == null) throw new ArgumentNullException(nameof(go));
            return go.transform.HasParentOfName(parentName, contains);
        }
        
        /// <summary>
        ///     Get object path relative to the parent object in hierarchy.
        /// </summary>
        /// <param name="obj">Object to get path for.</param>
        /// <param name="parent">Parent object in hierarchy.</param>
        /// <returns>Object path relative to the parent object in hierarchy.</returns>
        public static string GetRelativeObjectPath([NotNull] this GameObject obj, [NotNull] GameObject parent)
        {
            if (obj == null) throw new ArgumentNullException(nameof(obj));
            if (parent == null) throw new ArgumentNullException(nameof(parent));
            
            try
            {
                if (obj == parent)
                    return parent.name;

                var path = GetRelativeObjectPath
                (
                    obj.transform.parent.gameObject,
                    parent
                );

                return $"{path}/{obj.name}";
            }
            catch (Exception)
            {
                return obj.name;
            }
        }
        
        [NotNull]
        public static T CollectComponentInChildren<T>([NotNull] this GameObject g, in bool includeInactive = false, string rootName = null) where T : Component
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            if (i == null) i = g.GetComponentInChildren<T>(includeInactive);
            if (i == null)
            {
                if (string.IsNullOrEmpty(rootName))
                    i = g.AddComponent<T>();
                else
                {
                    var t = g.transform.Find(rootName);
                    if (t == null)
                    {
                        var newRoot = new GameObject(rootName);
                        newRoot.transform.SetParent(g.transform);
                        newRoot.transform.ResetLocalTransform();
                        t = newRoot.transform;
                    }
                    i = t.AddComponent<T>();
                }
            }
            
            return i;
        }
        
        /// <summary>
        ///     Finds and returns component of provided type in any object of local gameObject structure.
        /// </summary>
        /// <remarks>
        ///     Will add component locally if nowhere to be found.
        /// </remarks>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static T CollectComponentInAny<T>([NotNull] this GameObject g, in bool includeInactive = false) where T : Component
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            
            // Shall we remove those two?
            if (i == null) i = g.GetComponentInChildren<T>(includeInactive);
            if (i == null) i = g.GetComponentInParent<T>(includeInactive);
            
            if (i == null)
            {
                if (g.transform.parent != null)
                    i = g.transform.parent.GetComponentInChildren<T>(includeInactive);
            }

            if (i == null)
                i = g.AddComponent<T>();
            
            return i;
        }
        
        public static T CollectComponentInAnyParent<T>([NotNull] this GameObject g, in bool includeInactive = false) where T : Component
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            
            // Shall we remove those two?
            if (i == null) i = g.GetComponentInParent<T>(includeInactive);
            if (i == null)
                i = g.AddComponent<T>();
            
            return i;
        }
        
        public static T GetComponentInAnyParent<T>([NotNull] this GameObject g, in bool includeInactive = false) where T : Component
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            
            // Shall we remove those two?
            if (i == null) i = g.GetComponentInParent<T>(includeInactive);
  
            return i;
        }
        
        [CanBeNull]
        public static T GetComponentInParentInactive<T>(this GameObject g) where T : Component
        {
            var components = g.GetComponentsInParent<T>(true);
            if (components.Length == 0)
                return null;

            // Try to return component on same gameObject.
            for (var index0 = 0; index0 < components.Length; index0++)
            {
                var c = components[index0];
                if (c.gameObject == g)
                    return c;
            }

            return components[0];
        }
        
        /// <summary>
        ///     Finds and returns component of provided type in any object of local gameObject structure.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentInAny<T>([NotNull] this GameObject g, in bool includeInactive = false, int depth = 0)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            
            // Shall we remove those two?
            if (i == null) i = g.GetComponentInChildren<T>(includeInactive);
            if (i == null) i = g.GetComponentInParent<T>(includeInactive);

            if (i == null)
            {
                var parent = g.transform.parent;
                while (parent != null && depth > 0)
                {
                    depth--;
                    if (parent.parent != null)
                        parent = parent.parent;
                }

                if (parent != null)
                    i = parent.GetComponentInChildren<T>(includeInactive);
            }

            return i;
        }
        
        /// <summary>
        ///     Gets or adds (if not exists) new component to the GameObject.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static T CollectComponent<T>([NotNull] this GameObject g) where T : Component
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var i = g.GetComponent<T>();
            if (i == null)
                i = g.AddComponent<T>();

            return i;
        }
        
        /// <summary>
        ///     Gets or adds (if not exists) new component to the GameObject.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static Component CollectComponent([NotNull] this GameObject g, [NotNull] Type t)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            if (t == null) throw new ArgumentNullException(nameof(t));
            if (!t.IsSubclassOf(typeof(Component)))
                throw new ArgumentException($"Type {t.FullName} is not a subclass of Component.");

            var i = g.GetComponent(t);
            if (i == null)
                i = g.AddComponent(t);

            return i;
        }

        /// <summary>
        ///     Gets first type implemented script from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static MonoBehaviour GetComponentImplemented([NotNull] this GameObject g, [NotNull] Type t)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            if (t == null) throw new ArgumentNullException(nameof(t));
            
            var behaviours = g.GetComponents<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (!t.IsInstanceOfType(b))
                    continue;
                
                return b;
            }

            return null;
        }
        
        /// <summary>
        ///     Gets first type implemented script from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static MonoBehaviour GetComponentImplementedInChildren([NotNull] this GameObject g, [NotNull] Type t)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponentsInChildren<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (!t.IsInstanceOfType(b))
                    continue;
                
                return b;
            }

            return null;
        }
        
        /// <summary>
        ///     Gets first <typeparamref name="T"/> implemented script from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentImplemented<T>([NotNull] this GameObject g)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponents<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (b is T t)
                    return t;
            }

            return default;
        }
        
        /// <summary>
        ///     Gets first <typeparamref name="T"/> implemented script from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentImplementedInChildren<T>([NotNull] this GameObject g)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponentsInChildren<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (b is T t)
                    return t;
            }

            return default;
        }
        
        /// <summary>
        ///     Gets all type implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<MonoBehaviour> GetComponentsImplemented([NotNull] this GameObject g, [NotNull] in Type t)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            if (t == null) throw new ArgumentNullException(nameof(t));
            
            var behaviours = g.GetComponents<MonoBehaviour>();
            var collection = new List<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (!t.IsInstanceOfType(b))
                    continue;
                
                collection.Add(b);
            }

            return collection;
        }
        
        /// <summary>
        ///     Gets all type implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<MonoBehaviour> GetComponentsImplementedInChildren([NotNull] this GameObject g, [NotNull] in Type t, in bool includeInactive = false)
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            if (t == null) throw new ArgumentNullException(nameof(t));
            var behaviours = g.GetComponentsInChildren<MonoBehaviour>(includeInactive);
            var collection = new List<MonoBehaviour>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (!t.IsInstanceOfType(b))
                    continue;
                
                collection.Add(b);
            }

            return collection;
        }
        
        /// <summary>
        ///     Gets all <typeparamref name="T"/> implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplemented<T>([NotNull] this GameObject g) where T : class
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponents<MonoBehaviour>();
            var collection = new List<T>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (b is T t)
                    collection.Add(t);
            }

            return collection;
        }
        
        /// <summary>
        ///     Gets all <typeparamref name="T"/> implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplementedInChildren<T>([NotNull] this GameObject g, in bool includeInactive = false) where T : class
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponentsInChildren<MonoBehaviour>(includeInactive);
            var collection = new List<T>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (b is T t)
                    collection.Add(t);
            }

            return collection;
        }

        private static readonly List<MonoBehaviour> MonoBehavioursCache = new(32);
        /// <summary>
        ///     Gets all <typeparamref name="T"/> implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static void GetComponentsImplementedInChildren<T>([NotNull] this GameObject g, List<T> collection, in bool includeInactive = false) where T : class
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            MonoBehavioursCache.Clear();
            g.GetComponentsInChildren(includeInactive, MonoBehavioursCache);
            for (var index0 = 0; index0 < MonoBehavioursCache.Count; index0++)
            {
                var b = MonoBehavioursCache[index0];
                if (b is T t)
                    collection.Add(t);
            }
        }
        
        /// <summary>
        ///     Gets all <typeparamref name="T"/> implemented scripts from the object.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplementedInParent<T>([NotNull] this GameObject g, in bool includeInactive = false) where T : class
        {
            if (g == null) throw new ArgumentNullException(nameof(g));
            var behaviours = g.GetComponentsInParent<MonoBehaviour>(includeInactive);
            var collection = new List<T>();
            for (var index0 = 0; index0 < behaviours.Length; index0++)
            {
                var b = behaviours[index0];
                if (b is T t)
                    collection.Add(t);
            }

            return collection;
        }
    }
}
using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using UnityEngine;

namespace Extensions
{
    /// <summary>
    ///     Set of utility methods: <see cref="Component"/>
    /// </summary>
    public static class ExtensionComponent
    {
        /// <summary>
        ///     Sets the active state of GameObject of this component.
        /// </summary>
        /// <remarks>
        ///     A quick access to the SetActive of the GameObject component is attached to.
        /// </remarks>
        /// <exception cref="ArgumentNullException"/>
        public static void SetActive([NotNull] this Component component, bool activeState)
        {
            if (component == null) throw new ArgumentNullException(nameof(component));
            component.gameObject.SetActive(activeState);
        }

        /// <summary>
        ///     Gets component of given type if target is missing.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static T FillComponent<T>([NotNull] this Component component, [CanBeNull] T target) where T : Component
        {
            if (component == null) throw new ArgumentNullException(nameof(component));
            if (target == default(T))
                target = component.GetComponent<T>();
            
            return target;
        }
        
        /// <exception cref="ArgumentNullException"/>
        public static T FillComponentInParent<T>([NotNull] this Component component, [CanBeNull] T target) where T : Component
        {
            if (component == null) throw new ArgumentNullException(nameof(component));
            if (target == default(T))
                target = component.GetComponentInParent<T>();
            
            return target;
        }
        
        /// <summary>
        ///     Adds component of given type to this object.
        /// </summary>
        /// <remarks>
        ///     A quick access to the AddComponent of the GameObject component is attached to.
        /// </remarks>
        /// <exception cref="ArgumentNullException"/>
        public static T AddComponent<T>([NotNull] this Component component) where T : Component
        {
            if (component == null) throw new ArgumentNullException(nameof(component));
            return component.gameObject.AddComponent<T>();
        }
        
        /// <summary>
        ///     Adds component of given type to this object.
        /// </summary>
        /// <remarks>
        ///     A quick access to the AddComponent of the GameObject component is attached to.
        /// </remarks>
        /// <exception cref="ArgumentNullException"/>
        public static Component AddComponent([NotNull] this Component component, [NotNull] Type t)
        {
            if (component == null) throw new ArgumentNullException(nameof(component));
            if (t == null) throw new ArgumentNullException(nameof(t));
            if (!t.IsSubclassOf(typeof(Component)))
                throw new ArgumentException($"Type {t.FullName} is not a subclass of Component.");
            
            return component.gameObject.AddComponent(t);
        }

        /// <inheritdoc cref="ExtensionGameObject.CollectComponentInAny"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static T CollectComponentInAny<T>([NotNull] this Component c, in bool includeInactive = false) where T : Component
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.CollectComponentInAny<T>(includeInactive);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentInAny"/>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentInAny<T>([NotNull] this Component c, in bool includeInactive = false, in int depth = 0)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentInAny<T>(includeInactive, depth);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.CollectComponent"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static T CollectComponent<T>([NotNull] this Component c) where T : Component
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.CollectComponent<T>();
        }

        /// <inheritdoc cref="ExtensionGameObject.CollectComponent"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull]
        public static Component CollectComponent([NotNull] this Component c, [NotNull] Type t)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            if (t == null) throw new ArgumentNullException(nameof(t));
            return c.gameObject.CollectComponent(t);
        }

        /// <inheritdoc cref="ExtensionGameObject.GetComponentImplemented"/>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static MonoBehaviour GetComponentImplemented([NotNull] this Component c, [NotNull] Type t)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentImplemented(t);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentImplementedInChildren"/>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static MonoBehaviour GetComponentImplementedInChildren([NotNull] this Component c, [NotNull] Type t)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentImplementedInChildren(t);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentImplemented{T}"/>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentImplemented<T>([NotNull] this Component c)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentImplemented<T>();
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentImplementedInChildren{T}"/>
        /// <exception cref="ArgumentNullException"/>
        [CanBeNull]
        public static T GetComponentImplementedInChildren<T>([NotNull] this Component c)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentImplementedInChildren<T>();
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentsImplemented"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<MonoBehaviour> GetComponentsImplemented([NotNull] this Component c, [NotNull] in Type t)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentsImplemented(t);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentsImplementedInChildren"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<MonoBehaviour> GetComponentsImplementedInChildren([NotNull] this Component c, [NotNull] in Type t, in bool includeInactive = false)
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentsImplementedInChildren(t, includeInactive);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentsImplemented{T}"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplemented<T>([NotNull] this Component c) where T : class
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentsImplemented<T>();
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentsImplementedInChildren{T}"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplementedInChildren<T>([NotNull] this Component c, in bool includeInactive = false) where T : class
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentsImplementedInChildren<T>(includeInactive);
        }
        
        public static void GetComponentsImplementedInChildren<T>([NotNull] this Component c, List<T> collection, in bool includeInactive = false) where T : class
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            c.gameObject.GetComponentsImplementedInChildren<T>(collection, includeInactive);
        }
        
        /// <inheritdoc cref="ExtensionGameObject.GetComponentsImplementedInParent{T}"/>
        /// <exception cref="ArgumentNullException"/>
        [NotNull, ItemNotNull]
        public static List<T> GetComponentsImplementedInParent<T>([NotNull] this Component c, in bool includeInactive = false) where T : class
        {
            if (c == null) throw new ArgumentNullException(nameof(c));
            return c.gameObject.GetComponentsImplementedInParent<T>(includeInactive);
        }
    }
}

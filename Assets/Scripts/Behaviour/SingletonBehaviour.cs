using System;
using JetBrains.Annotations;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Behaviour
{
    /// <inheritdoc />
    /// <summary>
    ///     A base class that implements a 'Singleton pattern' for unity scripts.
    /// </summary>
    public abstract class SingletonBehaviour<TScript> : MonoBehaviour where TScript : SingletonBehaviour<TScript>
    {
        /// <summary>
        ///     Defines whether or not to disable duplicates.
        /// </summary>
        [Title("Singleton")]
        [SerializeField, HideInInspector] public bool disableDuplicates = true;

        private bool _needToAwake = true;
        
        protected void Awake()
        {
            if (Instance != null)
            {
                if (disableDuplicates)
                    gameObject.SetActive(false);
                
                OnDuplicate();
                return;
            }
            
#if DEBUG
            // Check if proper type has been provided.
            var t1 = GetType();
            var t2 = typeof(TScript);
            if (t1 != t2 && !t2.IsAssignableFrom(t1))
                throw new InvalidCastException($"{t1.Name} != {t2.Name}");
#endif
            
            Instance = (TScript) this;
            if (_needToAwake)
            {
                _needToAwake = false;
                OnAwake();
            }
        }

        protected void OnDestroy()
        {
            if (Instance != null && Instance == this)
            {
                Instance = null;
                OnSingletonDestroyed();
            }
        }

        /// <summary>
        ///     OnAwake method called directly by unity's <see cref="Awake"/> method.
        ///     IMPORTANT: This method is called only on first object, for duplicates use <see cref="OnDuplicate"/> instead.
        /// </summary>
        protected abstract void OnAwake();

        /// <summary>
        ///     OnDuplicate called when <see cref="Instance"/> is set, and this exact object is a duplicate.
        /// </summary>
        protected virtual void OnDuplicate() { Debug.LogWarning($"Duplicate of singleton of type {typeof(TScript).Name} detected.", this); }
        
        /// <summary>
        ///     OnSingletonDestroyed is called when <see cref="Instance"/> is being destroyed.
        /// </summary>
        protected virtual void OnSingletonDestroyed() {}

        /// <summary>
        ///     Finds first object of provided type (<see cref="TScript"/>) and sets is as currently active instance. 
        /// </summary>
        public static bool TryFindNext() => TryFindNext(Instance);
        
        /// <summary>
        ///     Finds first object of provided type (<see cref="TScript"/>) and sets is as currently active instance. 
        /// </summary>
        /// <remarks>
        ///     When <paramref name="ignore"/> is provided, target object will be ignored and not set as current instance.
        /// </remarks>
        public static bool TryFindNext([CanBeNull] TScript ignore)
        {
            var objs = FindObjectsOfType<TScript>();
            for (var index0 = 0; index0 < objs.Length; index0++)
            {
                var obj = objs[index0];
                if (ignore == null)
                {
                    Instance = obj;
                    return true;
                }

                if (obj == ignore)
                {
                    continue;
                }
                
                Instance = obj;
                return true;
            }

            Instance = null;
            return false;
        }

        /// <summary>
        ///     Sets the reference to the active singleton.
        /// </summary>
        /// <exception cref="ArgumentNullException"/>
        public static void SetInstance<T>([CanBeNull] T instance) where  T : TScript
        {
            // if (Instance == instance) return;
            if (Instance != null)
            {
                Instance._needToAwake = true;
                Instance.OnSingletonDestroyed();
            }
            
            Instance = instance;
            if (Instance == null) return;
            if (!Instance._needToAwake) return;
            Instance._needToAwake = false;
            Instance.OnAwake();
        }
        
        /// <summary>
        ///     Returns reference to the active instance of script.
        /// </summary>
        [NotNull]
        public static T GetInstance<T>() where T : TScript
        {
            var script = GetInstance();
            if (script is T t)
                return t;
            
            throw new InvalidCastException($"Unable to cast {typeof(T).Name} in to {typeof(TScript).Name}.");
        }
        
        /// <summary>
        ///     Returns reference to the active instance of script.
        /// </summary>
        /// <remarks>
        ///     Throws exception when <see cref="Instance"/> is not set to an instance of object.
        /// </remarks>
        [NotNull]
        public static TScript GetInstance()
        {
            if (Instance == null)
                throw new NullReferenceException($"Target Singleton does not have Instance set! ({typeof(TScript).FullName})");
            
            return Instance;
        }
        
#if UNITY_EDITOR
        [CanBeNull]
        public static TScript EditorFindInstance()
        {
            if (Instance != null)
                return Instance;
            
            var objs = FindObjectsOfType<TScript>();
            for (var index0 = 0; index0 < objs.Length; index0++)
            {
                var obj = objs[index0];
                if (obj.gameObject.activeSelf)
                    return obj;
            }

            return null;
        }
        
#endif
        
        /// <summary>
        ///     Reference to the active instance of <see cref="SingletonBehaviour{TScript}"/>.
        /// </summary>
        [CanBeNull]
        public static TScript Instance { get; protected set; }
    }
}
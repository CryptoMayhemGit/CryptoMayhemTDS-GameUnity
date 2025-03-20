using UnityEngine;
using UnityEngine.Pool;

namespace Assets.Scripts.Pooling
{
    public abstract class Pool<T> : ScriptableObject where T : Component
    {
        [SerializeField] private T prefab = null;
        [SerializeField, Min(1)] private int defaultCapcity = 10;
        [SerializeField, Min(1)] private int maxSize = 1000;

        [System.NonSerialized] private ObjectPool<T> pool;

        public virtual void Init(Transform parent)
        {
            pool = new ObjectPool<T>
                (
                    () => CreatePooledItem(parent),
                    component => OnTakeFromPool(component),
                    component => OnReturnedToPool(component),
                    component => OnDestroyPoolObject(component),
                    false,
                    defaultCapcity,
                    maxSize
                );
        }

        public T GetFromPool() => pool.Get();
        public void ReturnToPool(T component) => pool.Release(component);

        protected virtual T CreatePooledItem(Transform parent)
        {
            return Instantiate(prefab, parent);
        }

        protected virtual void OnReturnedToPool(T obj)
        {
            obj.gameObject.SetActive(false);
        }
        protected virtual void OnTakeFromPool(T obj)
        {
            obj.gameObject.SetActive(true);
        }

        protected virtual void OnDestroyPoolObject(T obj)
        {
            Destroy(obj.gameObject);
        }
    }
}
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using JetBrains.Annotations;

namespace Pooling
{
    public sealed class GenericPool<T> where T : IDisposable
    {
        private readonly ConcurrentBag<T> _pool;
        private readonly Func<T> _onCreateInstance;
        
        public GenericPool([NotNull] Func<T> onCreateInstance)
        {
            _onCreateInstance = onCreateInstance ?? throw new ArgumentNullException(nameof(onCreateInstance));
            _pool = new ConcurrentBag<T>();
        }

        public T Get() => _pool.TryTake(out var item) ? item : _onCreateInstance.Invoke();
        
        public void Return([CanBeNull] T item)
        {
            if (item == null!) return;
            item.Dispose();
            _pool.Add(item);
        }

        public void Return([CanBeNull] [ItemCanBeNull] IList<T> items)
        {
            if (items == null!) return;
            for (var index0 = 0; index0 < items.Count; index0++)
            {
                var item = items[index0];
                if (item == null)
                    continue;

                item.Dispose();
                _pool.Add(item);
            }
        }
    }
    
    public sealed class GenericPoolUnreliable<T>
    {
        private readonly ConcurrentBag<T> _pool;
        private readonly Func<T> _onCreateInstance;
        
        public GenericPoolUnreliable([NotNull] Func<T> onCreateInstance)
        {
            _onCreateInstance = onCreateInstance ?? throw new ArgumentNullException(nameof(onCreateInstance));
            _pool = new ConcurrentBag<T>();
        }

        public T Get() => _pool.TryTake(out var item) ? item : _onCreateInstance.Invoke();
        
        public void Return([CanBeNull] T item)
        {
            if (item == null!) return;
            _pool.Add(item);
        }
    }
}
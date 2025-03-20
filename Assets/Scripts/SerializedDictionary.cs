using System;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts
{
    [Serializable]
    public class SerializedDictionary<TKey, TValue> : Dictionary<TKey, TValue>, ISerializationCallbackReceiver
    {
        [Serializable]
        private struct KeyValuePair
        {
            [field: SerializeField] public TKey Key { private set; get; }
            [field: SerializeField] public TValue Value { private set; get; }

            public KeyValuePair(TKey Key, TValue Value)
            {
                this.Key = Key;
                this.Value = Value;
            }
        }

        [SerializeField, HideInInspector] private List<KeyValuePair> list = new();

        public void OnBeforeSerialize()
        {
            list.Clear();

            foreach (var pair in this)
                list.Add(new(pair.Key, pair.Value));
        }

        public void OnAfterDeserialize()
        {
            Clear();

            foreach (var pair in list)
                Add(pair.Key, pair.Value);
        }
    }
}
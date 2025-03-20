using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts
{
    [System.Serializable]
    public class SerializedQueue<T> : Queue<T>, ISerializationCallbackReceiver
    {
        [SerializeField, HideInInspector] private List<T> list = new();

        public void OnBeforeSerialize()
        {
            list.Clear();

            foreach (var item in this)
                list.Add(item);
        }

        public void OnAfterDeserialize()
        {
            Clear();

            foreach (var item in list)
                Enqueue(item);
        }
    }
}
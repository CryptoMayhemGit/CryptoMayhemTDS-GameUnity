using UnityEngine;

public abstract class SerializeFieldClassVariable<T> : ClassVariable<T>
    where T : class
{
    [SerializeField] private T startValue = null;

    protected override T Init()
    {
        if (startValue == null)
            return null;
        else if (typeof(T).IsSubclassOf(typeof(Object)))
            return startValue;
        else
            return (T)System.Activator.CreateInstance(typeof(T), new object[] { startValue });
    }
}
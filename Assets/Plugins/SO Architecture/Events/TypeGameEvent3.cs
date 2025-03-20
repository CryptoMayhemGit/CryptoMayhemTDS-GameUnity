using System;
using System.Collections.Generic;

public abstract class TypeGameEvent3<T1, T2, T3> : GameEvent
{
    private readonly List<TypeEventListener3<T1, T2, T3>> typedListeners = new List<TypeEventListener3<T1, T2, T3>>();
    private readonly List<Action<T1, T2, T3>> typedActions = new List<Action<T1, T2, T3>>();

    private List<TypeEventListener3<T1, T2, T3>> temporaryTypedListeners;
    private List<Action<T1, T2, T3>> temporaryTypedActions;

    [Sirenix.OdinInspector.Button("Raise Value")]
    public void Raise(T1 t1, T2 t2, T3 t3)
    {
        temporaryTypedListeners = new List<TypeEventListener3<T1, T2, T3>>(typedListeners);
        temporaryTypedActions = new List<Action<T1, T2, T3>>(typedActions);

        for (int i = 0; i < temporaryTypedListeners.Count; i++)
            temporaryTypedListeners[i].OnEventRaised(t1, t2, t3);

        for (int i = 0; i < temporaryTypedActions.Count; i++)
            temporaryTypedActions[i].Invoke(t1, t2, t3);

        Raise();
    }

    public void AddListener(TypeEventListener3<T1, T2, T3> listener) => typedListeners.Add(listener);
    public void AddListener(Action<T1, T2, T3> listener) => typedActions.Add(listener);

    public void RemoveListener(TypeEventListener3<T1, T2, T3> listener) => typedListeners.Remove(listener);
    public void RemoveListener(Action<T1, T2, T3> listener) => typedActions.Remove(listener);
}
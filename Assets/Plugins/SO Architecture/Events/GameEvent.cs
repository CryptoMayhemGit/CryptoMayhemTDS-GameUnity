using System;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = SOArchitectureDirectories.EVENT_SUBMENU + "Game Event")]
public class GameEvent : ScriptableObject
{
    private readonly List<GameEventListener> listeners = new List<GameEventListener>();
    private readonly List<Action> actions = new List<Action>();

    private List<GameEventListener> temporaryListeners;
    private List<Action> temporaryActions;

    [Sirenix.OdinInspector.Button("Raise")]
    public void Raise()
    {
        temporaryListeners = new List<GameEventListener>(listeners);
        temporaryActions = new List<Action>(actions);

        for (int i = 0; i < temporaryListeners.Count; i++)
            temporaryListeners[i].OnEventRaised();

        for (int i = 0; i < temporaryActions.Count; i++)
            temporaryActions[i].Invoke();
    }

    public void AddListener(GameEventListener listener) => listeners.Add(listener);
    public void AddListener(Action action) => actions.Add(action);

    public void RemoveListener(GameEventListener listener) => listeners.Remove(listener);
    public void RemoveListener(Action action) => actions.Remove(action);
}
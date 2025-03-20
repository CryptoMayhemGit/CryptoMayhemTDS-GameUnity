using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Effects
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Effect")]
    public class Effect : ScriptableObject
    {
        private enum RenewType { None, Restart, Stack }

        [SerializeReference] private System.Collections.Generic.List<Action.EffectAction> actions = null;
        [field: SerializeField] public Pooling.TransformPool VisualPool { private set; get; } = null;
        [field: SerializeField, Min(0.1f)] public float TickTime { private set; get; } = 0.1f;
        [field: SerializeField, Min(1)] public int TicksAmount { private set; get; } = 1;
        [field: SerializeField] public bool UseTickAtBegin { private set; get; } = false;
        [SerializeField] private RenewType renewType = RenewType.Restart;

        public void Renew(ref float currentTickTime, ref int ticks)
        {
            switch (renewType)
            {
                case RenewType.Restart:
                    if (TicksAmount == 1)
                        currentTickTime = TickTime;
                    else
                        ticks = TicksAmount;
                    return;

                case RenewType.Stack:
                    if (TicksAmount == 1)
                        currentTickTime += TickTime;
                    else
                        ticks += TicksAmount;
                    return;
            }
        }

        public void Begin(CharacterContainer container)
        {
            foreach (var action in actions) 
                action.Begin(container);
        }

        public void Tick(CharacterContainer container)
        {
            foreach (var action in actions) 
                action.Tick(container);
        }

        public void End(CharacterContainer container)
        {
            foreach (var action in actions) 
                action.End(container);
        }
    }
}
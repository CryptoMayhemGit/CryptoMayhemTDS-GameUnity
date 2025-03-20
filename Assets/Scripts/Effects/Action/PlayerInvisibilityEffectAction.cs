using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Effects.Action
{
    public class PlayerInvisibilityEffectAction : EffectAction
    {
        [SerializeField] private LayerMask invisibleMask = 0;
        [SerializeField] private LayerMask defaultMask = 0;

        public override void Begin(CharacterContainer container)
        {
            container.gameObject.layer = Mathf.RoundToInt(Mathf.Log(invisibleMask, 2f));
        }

        public override void End(CharacterContainer container)
        {
            container.gameObject.layer = Mathf.RoundToInt(Mathf.Log(defaultMask, 2f));
        }
    }
}
using Assets.Scripts.VisualEffect;
using UnityEngine;

namespace Assets.Scripts.Pooling
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Pool/VisualEffect")]
    public class VisualEffectsPool : Pool<VisualEffect.VisualEffectHolder>
    {
        public Transform DefaultParent { get; private set; }

        public override void Init(Transform parent)
        {
            base.Init(parent);
            DefaultParent = parent;
        }

        protected override VisualEffectHolder CreatePooledItem(Transform parent)
        {
            var obj = base.CreatePooledItem(parent);
            obj.Init(this);
            return obj;
        }
    }
}
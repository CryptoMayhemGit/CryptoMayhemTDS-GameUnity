namespace Assets.Scripts.Effects.Action
{
    public class AddEffectOnEndEffectAction : EffectAction
    {
        [UnityEngine.SerializeField] private Effect effect = null;

        public override void End(Containers.CharacterContainer container)
        {
            container.Effects.AddEffect(effect);
        }
    }
}
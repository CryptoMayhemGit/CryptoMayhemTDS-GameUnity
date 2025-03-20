namespace Assets.Scripts.Spawnable.MineActions
{
    public class AddEffectMineAction : MineAction
    {
        [UnityEngine.SerializeField] private Effects.Effect effect = null;

        public override void Trigger(Containers.CharacterContainer target)
        {
            target.Effects.AddEffect(effect);
        }
    }
}
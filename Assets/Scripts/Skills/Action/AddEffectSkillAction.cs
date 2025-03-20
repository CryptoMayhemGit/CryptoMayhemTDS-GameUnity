namespace Assets.Scripts.Skills.Action
{
    public class AddEffectSkillAction : SkillAction
    {
        [UnityEngine.SerializeField] private Effects.Effect effect = null;

        public override void Trigger(Containers.CharacterContainer origin, UnityEngine.Vector3 targetPosition)
        {
            origin.Effects.AddEffect(effect);
        }
    }
}
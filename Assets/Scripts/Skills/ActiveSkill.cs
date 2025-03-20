using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Skill/Active")]
    public class ActiveSkill : Skill, Cooldowns.IUsable
    {
        [System.Serializable]
        private struct TimeAction
        {
            [field: SerializeField] public float Time { private set; get; }
            [field: SerializeReference] public Action.SkillAction Action { private set; get; }
        }

        [field: SerializeField, Min(0)] public float Cooldown { private set; get; } = 10;
        [field: SerializeField, Min(0)] public float BiomassCost { private set; get; } = 0;
        [SerializeReference] private Condition.SkillCondition condition = null;
        [SerializeField] private Sound.SoundsHolder sounds;
        [SerializeField, Space] private TimeAction[] actions = new TimeAction[0];

        public float UseTime => actions[^1].Time;
        public int ActionsCount => actions.Length;

        public float GetActionTime(int index) => actions[index].Time;

        public bool CanUse(CharacterContainer character) => condition == null || condition.Check(character);

        public void TriggerAction(int index, CharacterContainer origin, Vector3 targetPosition)
        {
            actions[index].Action.Trigger(origin, targetPosition);
            
            if (sounds != null) 
                sounds.Play(origin.Transform.position);
        }
    }
}
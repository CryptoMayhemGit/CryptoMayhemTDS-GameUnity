using Assets.Scripts.Containers;
using Assets.Scripts.Skills.Passive;
using UnityEngine;

namespace Assets.Scripts.Skills
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Skill/Passive")]
    public class PassiveSkill : Skill
    {
        [field: SerializeField, Min(0)] public float BiomassCost { private set; get; } = 0;
        [SerializeReference] private SkillPassive[] passives = new SkillPassive[0];

        public void Enable(CharacterContainer character)
        {
            foreach (SkillPassive passive in passives)
                passive.Activate(character);
        }

        public void Disable(CharacterContainer character)
        {
            foreach (SkillPassive passive in passives)
                passive.Deactivate(character);
        }
    }
}
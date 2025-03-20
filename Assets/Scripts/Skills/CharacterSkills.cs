using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills
{
    public class CharacterSkills : CharacterComponent
    {
        [SerializeField] private CharacterContainer character = null;
        [SerializeField] private Stats.CachedDynamicStat biomass = new();
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        private bool isUsing;
        private ActiveSkill currentlyUsing;
        private float castTime;
        private int skillActionIndex;
        private Vector3 currentTargetPosition;

        public override void OnDespawn()
        {
            base.OnDespawn();

            if (isUsing)
            {
                isUsing = false;
                gameManager.Value.OnUpdate -= TriggerSkillActions;
            }
        }

        public bool CanUse(ActiveSkill skill)
        {
            return (skill.BiomassCost == 0 || biomass.Get().DynamicValue >= skill.BiomassCost) &&
                !character.Cooldowns.Contains(skill) &&
                !IsUsing(skill) &&
                skill.CanUse(character);
        }

        public void Use(ActiveSkill skill, Vector3 targetPosition)
        {
            if (skill.BiomassCost > 0)
                biomass.Get().ModifyDynamicValue(-skill.BiomassCost);

            if (skill.UseTime > 0)
            {
                bool wasUsing = isUsing;

                isUsing = true;
                skillActionIndex = 0;
                castTime = 0;
                currentlyUsing = skill;
                currentTargetPosition = targetPosition;

                if (!wasUsing)
                    gameManager.Value.OnUpdate += TriggerSkillActions;
            }
            else
                for (int i = 0; i < skill.ActionsCount; i++)
                    skill.TriggerAction(i, character, targetPosition);

            character.Cooldowns.Add(skill);
        }

        public bool IsUsing(ActiveSkill skill) => isUsing && currentlyUsing == skill;
        public bool IsUsing() => isUsing;

        private void TriggerSkillActions()
        {
            while (castTime >= currentlyUsing.GetActionTime(skillActionIndex))
            {
                currentlyUsing.TriggerAction(skillActionIndex, character, currentTargetPosition);

                if (++skillActionIndex == currentlyUsing.ActionsCount)
                {
                    isUsing = false;
                    gameManager.Value.OnUpdate -= TriggerSkillActions;

                    break;
                }
            }

            castTime += Time.deltaTime;
        }
    }
}
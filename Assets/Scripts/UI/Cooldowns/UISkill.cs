using Assets.Scripts.Skills;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI.Cooldowns
{
    public class UISkill : MonoBehaviour
    {
        [SerializeField] private Image skillIcon = null;
        [SerializeField] private Image skillCooldownFillBar = null;

        public Skill CurrentSkill { get; private set; }

        public void Init(Skill skill)
        {
            CurrentSkill = skill;

            if (skill != null)
            {
                if (skill.Sprite != null)
                    skillIcon.enabled = true;

                skillCooldownFillBar.enabled = true;
                skillIcon.sprite = skill.Sprite;
            }
            else
            {
                skillIcon.enabled = false;
                skillCooldownFillBar.enabled = false;
            }
        }

        public void Refresh(float currentTime, float endTime)
        {
            skillCooldownFillBar.fillAmount = 1f - currentTime / endTime;
        }
    }
}
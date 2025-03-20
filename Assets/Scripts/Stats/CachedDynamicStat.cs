using UnityEngine;

namespace Assets.Scripts.Stats
{
    [System.Serializable]
    public class CachedDynamicStat
    {
        [SerializeField] private CharacterStats stats = null;
        [SerializeField] private StatType statType = null;

        private DynamicStat dynamicStat;

        public DynamicStat Get()
        {
            if (dynamicStat == null)
                dynamicStat = stats.GetDynamicStat(statType);

            return dynamicStat;
        }
    }
}
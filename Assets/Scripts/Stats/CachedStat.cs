using UnityEngine;

namespace Assets.Scripts.Stats
{
    [System.Serializable]
    public class CachedStat
    {
        [SerializeField] private CharacterStats stats = null;
        [SerializeField] private StatType statType = null;

        private Stat stat;

        public Stat Get()
        {
            if (stat == null)
                stat = stats.GetStat(statType);

            return stat;
        }
    }
}
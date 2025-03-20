using Assets.Scripts.SOArchitecture;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Stats
{
    public class CharacterStats : CharacterComponent
    {
        [SerializeField] private SerializedDictionary<StatType, float> baseDynamicStats = new();
        [SerializeField] private SerializedDictionary<StatType, float> baseStats = new();

        [SerializeField] private QuestDataVariable questDataVariable = null;

        private bool inited;
        private Dictionary<StatType, DynamicStat> dynamicStats = new();
        private Dictionary<StatType, Stat> stats = new();

        public override void OnSpawn()
        {
            if (!inited)
            {
                base.OnSpawn();

                foreach (var item in baseDynamicStats)
                {
                    if (this.gameObject.tag == "Player" && item.Key.name == "Health" && questDataVariable.Value.IsTournament)
                    {
                        int tournamentHealthPoints = PlayerPrefs.GetInt("TournamentHealthPoints", 1);
                        dynamicStats.Add(item.Key, new DynamicStat(tournamentHealthPoints));
                    }
                    else if (this.gameObject.tag == "Player" && item.Key.name == "Shield" && questDataVariable.Value.IsTournament)
                    {
                        int tournamentShieldPoints = PlayerPrefs.GetInt("TournamentShieldPoints", 1);
                        dynamicStats.Add(item.Key, new DynamicStat(tournamentShieldPoints));
                    }
                    else
                    {
                        dynamicStats.Add(item.Key, new DynamicStat(item.Value));
                    }
                }

                foreach (var item in baseStats)
                {
                    if (this.gameObject.tag == "Player" && item.Key.name == "Movement Speed" && questDataVariable.Value.IsTournament)
                    {
                        int tournamentMovementSpeed = PlayerPrefs.GetInt("TournamentMovementSpeed", 1);
                        stats.Add(item.Key, new Stat(tournamentMovementSpeed));
                    }
                    else
                    {
                        stats.Add(item.Key, new Stat(item.Value));
                    }
                }

                foreach (var item in dynamicStats)
                    stats.Add(item.Key, item.Value);

                inited = true;
            }
            else
                foreach (var item in stats.Values)
                    item.Restore();
        }

        public DynamicStat GetDynamicStat(StatType statType) => dynamicStats[statType];
        public Stat GetStat(StatType statType) => stats[statType];
    }
}
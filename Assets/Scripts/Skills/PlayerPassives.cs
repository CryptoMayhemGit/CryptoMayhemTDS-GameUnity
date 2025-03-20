using Assets.Scripts.Containers;
using Assets.Scripts.Stats;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Skills
{
    public class PlayerPassives : CharacterComponent
    {
        private class PassiveInstance
        {
            private readonly PassiveSkill passive;
            private bool activated;

            public PassiveInstance(PassiveSkill passive)
            {
                this.passive = passive;
                activated = false;
            }

            public void Update(PlayerContainer player, DynamicStat biomass)
            {
                float cost = passive.BiomassCost * Time.deltaTime;

                if (cost <= biomass.DynamicValue)
                {
                    if (!activated)
                    {
                        activated = true;
                        passive.Enable(player);
                    }

                    biomass.ModifyDynamicValue(-cost);
                }
                else if (activated)
                {
                    activated = false;
                    passive.Disable(player);
                }
            }
        }

        [SerializeField] private PlayerContainer player = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private CachedDynamicStat biomass = new();

        private readonly System.Collections.Generic.List<PassiveInstance> passives = new();

        public override void OnSpawn()
        {
            base.OnSpawn();

            foreach (var skill in player.Inventory.Technologys)
                if (skill != null && skill is PassiveSkill passive)
                    passives.Add(new PassiveInstance(passive));

            if (passives.Count > 0)
                gameManager.Value.OnUpdate += UpdatePassives;
        }

        public override void OnDespawn()
        {
            base.OnDespawn();

            if (passives.Count > 0)
            {
                gameManager.Value.OnUpdate -= UpdatePassives;
                passives.Clear();
            }
        }

        private void UpdatePassives()
        {
            Profiler.BeginSample("PlayerPassives.UpdatePassives");
            for (int i = 0; i < passives.Count; i++)
                passives[i].Update(player, biomass.Get());
            Profiler.EndSample();
        }
    }
}
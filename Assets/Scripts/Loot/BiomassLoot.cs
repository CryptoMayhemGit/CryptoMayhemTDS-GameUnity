using Assets.Scripts.Containers;
using Assets.Scripts.Spawnable;
using UnityEngine;

namespace Assets.Scripts.Loot
{
    public class BiomassLoot : MonoBehaviour
    {
        [SerializeField] private CharacterContainer character = null;
        [SerializeField] private Stats.CachedStat biomass = new();
        [SerializeField] private Pooling.SpawnableItemPool pool = null;

        public void Drop()
        {
            if (biomass.Get().Value <= 0)
                return;

            SpawnableItem biomassToSpawn = pool.GetFromPool();
            biomassToSpawn.Transform.SetPositionAndRotation(character.Transform.position, character.Transform.rotation);
            biomassToSpawn.Init(character, biomass.Get().Value);
        }
    }
}
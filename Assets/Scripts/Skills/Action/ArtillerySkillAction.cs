using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.Skills.Action
{
    public class ArtillerySkillAction : SkillAction
    {
        [SerializeField] private Pooling.ArtilleryImpactPool pool = null;
        [SerializeField] private Weapons.ArtilleryImpacts.ArtilleryImpactCore artilleryImpactCore = new();

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            var artilleryImpact = pool.GetFromPool();
            artilleryImpact.Transform.position = targetPosition;
            artilleryImpact.Init(origin, artilleryImpactCore, pool);
        }
    }
}
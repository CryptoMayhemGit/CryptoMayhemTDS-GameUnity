using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class SpawnSkillAction : SkillAction
    {
        [System.Serializable]
        private abstract class SpawnType
        {
            public abstract Vector3 GetPosition(CharacterContainer character, Vector3 targetPosition);
        }

        private class TargetSpawnType : SpawnType
        {
            [SerializeField, Min(0.5f)] private float maxRange = 1f;

            public override Vector3 GetPosition(CharacterContainer character, Vector3 targetPosition)
            {
                Vector3 direction = targetPosition - character.Transform.position;

                if (direction.sqrMagnitude < maxRange * maxRange)
                    return targetPosition;
                else
                    return direction.normalized * maxRange + character.Transform.position;
            }
        }

        private class PivotSpawnType : SpawnType
        {
            [SerializeField] private Vector3 pivot = Vector3.back;

            public override Vector3 GetPosition(CharacterContainer character, Vector3 targetPosition)
            {
                return character.Transform.position + character.Transform.rotation * pivot;
            }
        }

        [SerializeField] private Pooling.SpawnableItemPool pool = null;
        [SerializeReference] private SpawnType spawnType = new PivotSpawnType();

        public override void Trigger(CharacterContainer origin, Vector3 targetPosition)
        {
            var spawnableItem = pool.GetFromPool();
            spawnableItem.Transform.position = spawnType.GetPosition(origin, targetPosition);
            spawnableItem.Init(origin);
        }
    }
}
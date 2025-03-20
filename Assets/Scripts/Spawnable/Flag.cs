using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class Flag : SpawnableItem
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField, Min(1)] private float delay = 5f;

        private CharacterContainer owner;
        private float time;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            this.owner = owner;
            time = 0;

            gameManager.Value.OnUpdate += Teleport;
        }

        private void Teleport()
        {
            Profiler.BeginSample("Flag.Teleport");
            if ((time += Time.deltaTime) >= delay)
            {
                gameManager.Value.OnUpdate -= Teleport;

                owner.Rigidbody.position = Transform.position;

                Pool.ReturnToPool(this);
            }
            Profiler.EndSample();
        }
    }
}
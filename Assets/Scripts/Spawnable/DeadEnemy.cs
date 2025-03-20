using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawnable
{
    public class DeadEnemy : SpawnableItem
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Animator animator = null;
        [SerializeField] private float stayTime = 20f;
        [SerializeField] private float fadingTime = 1f;
        [SerializeField] private float fadingSpeed = 10f;

        private float stayTimer;
        private float fadingTimer;
        private bool isInitialized;
        private int deathHash;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            if (!isInitialized)
            {
                deathHash = Animator.StringToHash("Death");
                isInitialized = true;
            }

            stayTimer = 0;
            fadingTimer = 0;
            Transform.position = owner.Transform.position;
            Transform.rotation = owner.Transform.rotation;
            Transform.localScale = owner.Transform.localScale;
            animator.SetTrigger(deathHash);
            gameManager.Value.OnUpdate += OnUpdate;
        }

        private void OnUpdate()
        {
            Profiler.BeginSample("DeadEnemy.OnUpdate");
            stayTimer += Time.deltaTime;
            if (stayTimer < stayTime)
            {
                Profiler.EndSample();
                return;
            }

            fadingTimer += Time.deltaTime;
            // Transform.position += new Vector3(0, fadingSpeed * Time.deltaTime, 0);
            Transform.position -= new Vector3(0, fadingSpeed * Time.deltaTime, 0);
            // Transform.localScale -= Vector3.one * fadingSpeed * Time.deltaTime;
            // if (Transform.localScale.x > 0)
            if (fadingTimer < fadingTime)
            {
                Profiler.EndSample();
                return;
            }

            gameManager.Value.OnUpdate -= OnUpdate;
            Pool.ReturnToPool(this);
            Profiler.EndSample();
        }
    }
}
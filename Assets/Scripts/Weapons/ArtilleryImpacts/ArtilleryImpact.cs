using Assets.Scripts.Pooling;
using Assets.Scripts.Containers;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Weapons.ArtilleryImpacts
{
    public class ArtilleryImpact : MonoBehaviour
    {
        [field: SerializeField] public Transform Transform { private set; get; } = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private FMODUnity.EventReference impactSound = default;
        [SerializeField] private VisualEffectsPool impactVisual = null;

        private CharacterContainer owner;
        private ArtilleryImpactCore core;
        private ArtilleryImpactPool pool;

        private float time;

        public void Init(CharacterContainer character, ArtilleryImpactCore artilleryImpactCore, ArtilleryImpactPool pool)
        {
            owner = character;
            core = artilleryImpactCore;
            this.pool = pool;

            Transform.localScale = Vector3.one * (artilleryImpactCore.Radius * 2); //TODO usunac to pozniej

            time = 0f;

            gameManager.Value.OnUpdate += UpdateLifeTime;

            FMODUnity.RuntimeManager.PlayOneShot(impactSound, Transform.position);
        }

        private void UpdateLifeTime()
        {
            Profiler.BeginSample("ArtilleryImpact.UpdateLifeTime");
            if ((time += Time.deltaTime) >= core.Delay)
            {
                gameManager.Value.OnUpdate -= UpdateLifeTime;
                impactVisual.GetFromPool().Play(transform.position);

                Collider[] hits = Physics.OverlapSphere(Transform.position, core.Radius, core.TargetLayer);

                foreach (var hit in hits)
                    foreach (var action in core.HitActions)
                        action.OnHit(owner, hit.GetComponent<CharacterContainer>());

                foreach (var item in core.DestroyActions)
                    item.OnDestroy(owner, Transform.position, Transform.rotation);

                foreach (var item in core.Layers)
                    foreach (var hit in hits)
                        if ((hit.transform.position - Transform.position).sqrMagnitude < item.Radius * item.Radius)
                            item.Action.OnHit(owner, hit.GetComponent<CharacterContainer>());

                pool.ReturnToPool(this);
            }
            Profiler.EndSample();
        }
    }
}
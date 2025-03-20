using System;
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Spawnable
{
    public class Shockwave : SpawnableItem
    {
        [SerializeField] private SphereCollider sphereCollider = null;
        // [SerializeField] private LineRenderer lineRenderer = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Pooling.VisualPool visualPool = null;
        [SerializeField, Min(0)] private float startingColliderRadius = 0.1f;
        [SerializeField, Min(0.1f)] private float endColliderRadius = 10f;
        [SerializeField, Min(0.1f)] private float spreadTime = 1f;
        [SerializeField, Range(1, 360)] private int spreadAngle = 40;
        [SerializeReference] private System.Collections.Generic.List<Weapons.HitActions.HitAction> hitActions = new();

        private Vector3 startingPosition;
        private Vector3 shootDirection;
        private int shootAngleSegment;

        private AnimationCurve spreadProfile = new AnimationCurve(new Keyframe(0, 2f), new Keyframe(0.5f, 0.75f), new Keyframe(1f, 0.4f));
        private CharacterContainer owner;
        private float step;

        public override void Init(CharacterContainer owner, object valueToSet = null)
        {
            this.owner = owner;
            step = (endColliderRadius - startingColliderRadius) / spreadTime * Time.fixedDeltaTime;

            startingPosition = owner.Transform.position;
            shootDirection = owner is PlayerContainer container ? container.CannonRotate.XRotator.forward : owner.Transform.forward;

            float angle = Mathf.Atan2(shootDirection.x, shootDirection.z) / Mathf.PI * 180f;
            shootAngleSegment = angle < 0 ? Mathf.RoundToInt(angle + 360f) : Mathf.RoundToInt(angle);

            // lineRenderer.positionCount = spreadAngle;

            Visual visual = visualPool.GetFromPool();
            visual.Init(owner.Transform);
            gameManager.Value.OnUpdate += UpdateTick;
            gameManager.Value.OnFixedUpdate += UpdateFixedTick;
        }

#if UNITY_EDITOR
        private void OnValidate() => sphereCollider.radius = startingColliderRadius;
#endif

        private void OnTriggerEnter(Collider other)
        {
            float checkAngle = spreadAngle * spreadProfile.Evaluate(Mathf.InverseLerp(0, endColliderRadius, sphereCollider.radius));
            if (spreadAngle == 360 || Vector3.Angle(other.transform.position - (startingPosition + shootDirection), (startingPosition + shootDirection) - startingPosition) <= checkAngle)
            {
                CharacterContainer current = other.GetComponent<CharacterContainer>();

                foreach (var item in hitActions)
                    item.OnHit(owner, current);
            }
        }

        private void UpdateFixedTick() => sphereCollider.radius += step;

        private void UpdateTick()
        {
            if (sphereCollider.radius > endColliderRadius)
            {
                gameManager.Value.OnUpdate -= UpdateTick;
                gameManager.Value.OnFixedUpdate -= UpdateFixedTick;
                sphereCollider.radius = startingColliderRadius;
                Pool.ReturnToPool(this);
            }

            // DrawCircle(sphereCollider.radius);
        }

        // private void DrawCircle(float radius)
        // {
        //     int currentAngleIndex = shootAngleSegment - Mathf.RoundToInt(spreadAngle * 0.5f);
        //     if (currentAngleIndex < 0)
        //         currentAngleIndex = 360 + currentAngleIndex;

        //     for (int i = 0; i < spreadAngle; i++)
        //     {
        //         float radian = (++currentAngleIndex % 360) * Mathf.Deg2Rad;
        //         lineRenderer.SetPosition(i, new Vector3(Mathf.Sin(radian) * radius, 0.1f, Mathf.Cos(radian) * radius));
        //     }
        // }

        // private void OnDrawGizmosSelected()
        // {
        //     Gizmos.color = new Color(255, 0, 0, 0.25f);
        //     Gizmos.DrawSphere(transform.position, endColliderRadius);
        // }
    }
}
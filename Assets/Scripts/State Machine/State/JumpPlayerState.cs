using Assets.Scripts.Containers;
using Assets.Scripts.Skills.Action;
using Assets.Scripts.Damage;
using UnityEngine;
using System.Collections.Generic;
using Assets.Scripts.Weapons.HitActions;
using UnityEngine.Profiling;

namespace Assets.Scripts.StateMachine.State
{
    public class JumpPlayerState : PlayerState
    {
        private List<HitAction> hitActions;
        private readonly float distance;
        private readonly float force;
        private readonly float rigidbodyMass;
        private float temporaryRigidbodyMass;
        private readonly LayerMask obstacles;
        private readonly Vector3 direction;
        private readonly Vector3 startPosition;
        private readonly Vector3 endPosition;
        private readonly SkillAction onEndJump;

        public JumpPlayerState(PlayerContainer player, List<HitAction> hitActions, float distance, float force,
            LayerMask obstacles, SkillAction onEndJump, float rigidbodyMass) : base(player)
        {
            this.hitActions = hitActions;
            this.distance = distance;
            this.force = force;
            this.obstacles = obstacles;
            this.rigidbodyMass = rigidbodyMass;
            this.direction = new Vector3(player.Input.MovementDirection.x, 0, player.Input.MovementDirection.y)
                .normalized;
            this.startPosition = player.Rigidbody.position;
            this.onEndJump = onEndJump;

            if (Physics.SphereCast(startPosition, player.DashCollisionDetector.SphereCollider.radius * 2f, direction,
                    out var hit, distance, obstacles))
                this.endPosition = hit.point - direction * (player.DashCollisionDetector.SphereCollider.radius * 2f);
            else
                this.endPosition = player.Rigidbody.position + direction * distance;
        }

        public override void OnEnter()
        {
            Debug.DrawLine(player.Rigidbody.position, endPosition, Color.green, 5f);
            temporaryRigidbodyMass = player.Rigidbody.mass;
            player.Rigidbody.mass = rigidbodyMass;

            player.Rigidbody.AddForce(direction * force, ForceMode.Impulse);

            player.Health.AddImmortalFactor();
            player.DashCollisionDetector.gameObject.SetActive(true);
            player.DashCollisionDetector.OnCollision += OnCollisionWithEnemy;
            // player.Trail.emitting = true;

            player.AnimationController.StartDashAnimation(direction);
        }

        public override void OnExit()
        {
            player.Rigidbody.mass = temporaryRigidbodyMass;
            player.Health.RemoveImmortalFactor();
            player.DashCollisionDetector.OnCollision -= OnCollisionWithEnemy;
            player.DashCollisionDetector.gameObject.SetActive(false);
            // player.Trail.emitting = false;
            onEndJump?.Trigger(player, player.Transform.position);

            player.AnimationController.EndDashAnimation();
        }

        public override void OnUpdate(float delta)
        {
            Profiler.BeginSample("JumpPlayerState.OnUpdate");
            var distanceToEnd = Vector3.Distance(player.Rigidbody.position, endPosition);
            if (distanceToEnd < player.DashCollisionDetector.SphereCollider.radius * 2f || distanceToEnd > distance ||
                player.Rigidbody.velocity.magnitude < 1f)
                player.StateMachine.TryChangeState(new DefaultPlayerState(player));
            Profiler.EndSample();
        }

        public override void OnCollision(Collision collision)
        {
            base.OnCollision(collision);
            if(((1<<collision.collider.gameObject.layer) & obstacles) != 0)
                player.StateMachine.ForceChangeState(new DefaultPlayerState(player));
        }

        private void OnCollisionWithEnemy(CharacterContainer enemy)
        {
            foreach (var item in hitActions)
                item.OnHit(player, enemy);
        }
    }
}
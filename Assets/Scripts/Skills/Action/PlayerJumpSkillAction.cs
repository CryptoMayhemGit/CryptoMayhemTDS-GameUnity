using Assets.Scripts.Containers;
using Assets.Scripts.StateMachine.State;
using UnityEngine;

namespace Assets.Scripts.Skills.Action
{
    public class PlayerJumpSkillAction : SkillAction
    {
        [SerializeField, Min(1f)] private float distance = 15f;
        [SerializeField, Min(1f)] private float force = 100f;
        [SerializeField, Min(1f)] private float rigidbodyMass = 1000f;
        [SerializeField] private LayerMask obstacles = 0;
        [SerializeReference] private System.Collections.Generic.List<Weapons.HitActions.HitAction> hitActions = null;
        [SerializeReference] private SkillAction onEndJump = null;
        [SerializeReference] private GameObject onLandEffect;
        public override void Trigger(CharacterContainer origin, UnityEngine.Vector3 targetPosition)
        {
            var playerState = new JumpPlayerState((PlayerContainer)origin, hitActions, distance, force, obstacles, onEndJump, rigidbodyMass);
            ((PlayerContainer)origin).StateMachine.TryChangeState(playerState);
        }
    }
}
using System.Collections.Generic;
using Assets.Scripts.Containers;
using Assets.Scripts.StateMachine.State;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    [HideMonoScript, DisallowMultipleComponent]
    public sealed class PlayZoneManager : MonoBehaviour
    {
        [SerializeField] private PlayerContainer player;

        private void FixedUpdate()
        {

            var isPlayerInsideZone = IsPlayerInsidePlayZone();
            if (isPlayerInsideZone) return;

            player.StateMachine.ForceChangeState(new FallPlayerState(player));
        }

        private bool IsPlayerInsidePlayZone()
        {
            if (player == null) return true; // return true if player is not yet spawned or there are no play zones.
            return IsInsidePlayZone(player.Transform.position);
        }
        
        public static bool IsInsidePlayZone(Vector2 point)
        {
            if (PlayZones.Count == 0) return true;
            for (var index0 = 0; index0 < PlayZones.Count; index0++)
            {
                var zone = PlayZones[index0];
                if (zone.IsInsideZone(point))
                    return true;
            }

            return false;
        }

        /// <summary>
        ///     List of all zone presenters in scene.
        /// </summary>
        public static readonly List<PlayZone> PlayZones = new List<PlayZone>();
    }
}
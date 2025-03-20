using Assets.Scripts.Sound;
using UnityEngine;

namespace Assets.Scripts.Animations
{
    public class PlayerAnimationEventListener : MonoBehaviour
    {
        [SerializeField] PlayerSounds sounds;

        private void StepWalk()
        {
            sounds.PlayWalk();
        }

        private void StepRun()
        {
            sounds.PlayRun();
        }

        private void LandEnd()
        {
            sounds.PlayLandEnd();
        }
    }
}
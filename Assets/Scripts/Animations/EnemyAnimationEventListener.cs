using Assets.Scripts.Sound;
using UnityEngine;

namespace Assets.Scripts.Animations
{
    public class EnemyAnimationEventListener : MonoBehaviour
    {
        [SerializeField] EnemySounds sounds;

        private void StepWalk()
        {
            sounds.PlayWalk();
        }

        private void StepRun()
        {
            sounds.PlayRun();
        }
    }
}
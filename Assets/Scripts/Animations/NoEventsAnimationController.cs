using UnityEngine;

namespace Animations
{
    public class NoEventsAnimationController : MonoBehaviour
    {
        private Animator animator;

        private void Awake()
        {
            animator = GetComponent<Animator>();
            animator.fireEvents = false;
        }
    }
}

using UnityEngine;

namespace Assets.Scripts
{
    public class TransformFollower : MonoBehaviour
    {
        [SerializeField] private Transform tr = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;

        private Transform target;

        public void SetTarget(Transform transform)
        {
            if (transform == null)
            {
                gameManager.Value.OnLateUpdate -= Follow;
                target = null;
            }
            else
            {
                target = transform;
                gameManager.Value.OnLateUpdate += Follow;
            }
        }

        private void Follow()
        {
            transform.position = new Vector3(target.position.x, tr.position.y, target.position.z);
        }
    }
}
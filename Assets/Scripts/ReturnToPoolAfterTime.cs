using UnityEngine;

namespace Assets.Scripts
{
    public class ReturnToPoolAfterTime : MonoBehaviour
    {
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Transform tr = null;
        [SerializeField, Min(0.1f)] private float lifeTime = 0.1f;
        [SerializeField] private Pooling.TransformPool pool = null;

        private float endLiveTime;

        private void OnEnable()
        {
            endLiveTime = Time.time + lifeTime;
            gameManager.Value.OnUpdate += OnUpdate;
        }
        private void OnDisable() => gameManager.Value.OnUpdate -= OnUpdate;

        private void OnUpdate()
        {
            if (endLiveTime <= Time.time)
                pool.ReturnToPool(tr);
        }
    }
}
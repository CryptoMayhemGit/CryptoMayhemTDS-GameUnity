using UnityEngine;

namespace Assets.Scripts.Spawnable
{
    public class Visual : MonoBehaviour
    {
        [field: SerializeField] public Transform Transform { private set; get; } = null;
        [SerializeField] protected Pooling.VisualPool Pool = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManagerVariable = null;
        [SerializeField] private float returnTime = 5f;

        private float timer = 0;

        public void Init(Transform owner)
        {
            timer = 0;
            Transform.position = owner.position;
            Transform.rotation = owner.rotation;
            gameManagerVariable.Value.OnUpdate += UpdateTick;
        }

        protected virtual void UpdateTick()
        {
            timer += Time.deltaTime;
            if (timer >= returnTime)
            {
                gameManagerVariable.Value.OnUpdate -= UpdateTick;
                Pool.ReturnToPool(this);
            }
        }
    }
}
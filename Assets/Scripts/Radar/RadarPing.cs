using Assets.Scripts.Pooling;
using UnityEngine;
using UnityEngine.UI;

namespace Radar
{
    public class RadarPing : MonoBehaviour
    {
        [SerializeField] private TransformPool radarPingPool;
        
        private Image image;
        private float disappearTimer;
        private float disappearTimerMax;
        private Color color;

        private void Awake()
        {
            image = GetComponent<Image>();
            disappearTimerMax = 1f;
            disappearTimer = 0f;
            color = new Color(1, 1, 1, 1f);
        }

        private void Update()
        {
            disappearTimer += Time.deltaTime;

            color.a = Mathf.Lerp(disappearTimerMax, 0f, disappearTimer / disappearTimerMax);
            image.color = color;

            if (disappearTimer >= disappearTimerMax)
                radarPingPool.ReturnToPool(transform);
        }

        public void SetColor(Color color)
        {
            this.color = color;
        }

        public void SetDisappearTimer(float disappearTimerMax)
        {
            this.disappearTimerMax = disappearTimerMax;
            disappearTimer = 0f;
        }
    }
}
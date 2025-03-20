using Cinemachine;
using UnityEngine;

namespace Assets.Scripts.Cinemachine
{
    public class CinemachineShake : MonoBehaviour
    {
        [SerializeField] private CinemachineVirtualCamera cinemachineVirtualCamera;
        private float shakeTimer;
        private float shakeTimerTotal;
        private float startingIntensity;

        private void Update()
        {
            if (shakeTimer > 0f)
            {
                shakeTimer -= Time.deltaTime;

                CinemachineBasicMultiChannelPerlin cinemachineBasicMultiChannelPerlin = GetCinemachineBasicMultiChannelPerlin();

                cinemachineBasicMultiChannelPerlin.m_AmplitudeGain = Mathf.Lerp(startingIntensity, 0f, 1 - (shakeTimer / shakeTimerTotal));
            }
        }

        public void ShakeCamera(float intensity, float time)
        {
            CinemachineBasicMultiChannelPerlin cinemachineBasicMultiChannelPerlin = GetCinemachineBasicMultiChannelPerlin();

            cinemachineBasicMultiChannelPerlin.m_AmplitudeGain = intensity;

            startingIntensity = intensity;
            shakeTimerTotal = time;
            shakeTimer = time;
        }

        private CinemachineBasicMultiChannelPerlin GetCinemachineBasicMultiChannelPerlin()
        {
            return cinemachineVirtualCamera.GetCinemachineComponent<CinemachineBasicMultiChannelPerlin>();
        }
    }
}

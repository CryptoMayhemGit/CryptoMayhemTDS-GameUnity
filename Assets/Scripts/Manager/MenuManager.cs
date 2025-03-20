using Cinemachine;
using UnityEngine;

namespace Assets.Scripts.Manager
{
    public class MenuManager : MonoBehaviour
    {
        private const int MAX_CAMERA_PRIORITY = 11;
        private const int COMMON_CAMERA_PRIORITY = 10;

        [System.Serializable]
        private class UICameraContainer
        {
            [field: SerializeField] public GameObject Ui { private set; get; } = null;
            [field: SerializeField] public CinemachineVirtualCamera Camera { private set; get; } = null;
        }

        [SerializeField] private CinemachineBrain brain = null;
        [SerializeField] private UICameraContainer[] container = new UICameraContainer[0];

        private int currentView;

        private bool wasBlendingLastFrame;

        public void ChangeView(int index)
        {
            container[currentView].Ui.SetActive(false);
            container[currentView].Camera.Priority = COMMON_CAMERA_PRIORITY;

            currentView = index;

            container[currentView].Camera.Priority = MAX_CAMERA_PRIORITY;
        }

        private void Update()
        {
            if (brain.IsBlending)
                wasBlendingLastFrame = true;
            else if (wasBlendingLastFrame)
            {
                wasBlendingLastFrame = false;
                container[currentView].Ui.SetActive(true);
            }
        }
    }
}
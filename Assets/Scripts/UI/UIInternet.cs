using UnityEngine;
using UnityEngine.Localization.PropertyVariants.TrackedProperties;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIInternet : MonoBehaviour
    {
        [SerializeField] private Image image;
        [SerializeField] float interval = 3f;
        private float time;

        void Start()
        {
            time = 0f;
        }

        void Update()
        {
            time += Time.deltaTime;
            while (time >= interval)
            {
                CheckInternetConnection();
                time -= interval;
            }
        }

        void OnEnable()
        {
            image.gameObject.SetActive(false);
            CheckInternetConnection();
        }

        private void CheckInternetConnection()
        {
            if (Application.internetReachability == NetworkReachability.NotReachable)
            {
                image.gameObject.SetActive(true);
            }
            else
            {
                image.gameObject.SetActive(false);
            }
        }
    }
}

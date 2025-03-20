using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIGoToBrowser : MonoBehaviour
    {
        [SerializeField] private string url;

        public void GoToBrowser()
        {
            Application.OpenURL(url);
        }
    }
}
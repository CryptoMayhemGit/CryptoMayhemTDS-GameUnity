using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIProgressBar : MonoBehaviour
    {
        [SerializeField] private Image loadingBarFill = null;
        
        public void SetProgressBar(float value)
        {
            loadingBarFill.fillAmount = value;
        }
    }
}
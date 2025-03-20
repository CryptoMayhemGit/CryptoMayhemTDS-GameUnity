using Assets.Scripts.Containers;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIZealyuBar : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI UILabel;
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";

        void OnEnable()
        {
            int zealyLevel = PlayerPrefs.GetInt(ZEALY_LEVEL);
            UILabel.text = zealyLevel.ToString();
        }
    }
}
using UnityEngine;

namespace Assets.Scripts.Helper
{
    public class PlayerPrefsEvents : MonoBehaviour
    {
        public void IncrementIntPlayerPref(string playerPrefName)
        {
            PlayerPrefs.SetInt(playerPrefName, PlayerPrefs.GetInt(playerPrefName) + 1);
        }
    }
}
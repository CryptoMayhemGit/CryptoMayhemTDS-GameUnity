using UnityEngine;

namespace Assets.Scripts.UI.Checker
{
    public class HangarPopupChecker : MonoBehaviour
    {
        private const string PLAYED_GAMES_COUNT = "PlayedGamesCount";
        
        private void Start()
        {
            int playedGamesCount = PlayerPrefs.GetInt(PLAYED_GAMES_COUNT);

            if(playedGamesCount >= 3)
            {
                gameObject.SetActive(false);
            }
        }
    }
}
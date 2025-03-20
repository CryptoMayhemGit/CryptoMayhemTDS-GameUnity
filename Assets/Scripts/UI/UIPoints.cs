using Assets.Scripts.LeaderBoard.Models;
using Newtonsoft.Json;
using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;

namespace Assets.Scripts.UI
{
    public class UIPoints : MonoBehaviour
    {

        [SerializeField] private IntVariable enemiesKilled;
        [SerializeField] private GameObject pointsSector;
        [SerializeField] private TextMeshProUGUI pointsText;

        public void CalculatePoints(bool isWin)
        {
            pointsSector.SetActive(false);
            StartCoroutine(Send(isWin));
        }

        private IEnumerator Send(bool isWin)
        {
            string url = $"https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard/GetPlayerPoints?IsWin={isWin.ToString().ToLower()}&Kills={enemiesKilled.Value}";

            using UnityWebRequest webRequest = UnityWebRequest.Get(url);
            {
                yield return webRequest.SendWebRequest();

                if (webRequest.result == UnityWebRequest.Result.Success)
                {
                    PlayerPointsResponse statsResponse = JsonConvert.DeserializeObject<PlayerPointsResponse>(webRequest.downloadHandler.text);

                    pointsText.text = statsResponse.Points.ToString();
                    pointsSector.SetActive(true);
                    yield break;
                }
            }
        }
    }
}

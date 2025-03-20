using System.Collections;
using UnityEngine.Networking;
using UnityEngine;
using Assets.Scripts.UI.Authorization.Models;
using Assets.Scripts.Questlog;
using TMPro;

namespace Assets.Scripts.UI
{
    public class UISetTournamentData : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI gameName = null;
        [SerializeField] private TextMeshProUGUI gameDescription = null;

        private void Awake()
        {
            StartCoroutine(IsAnyTicketTournamentActive());
        }

        private IEnumerator IsAnyTicketTournamentActive()
        {
            string url = $"https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard/GetActiveTournament";

            using UnityWebRequest webRequest = UnityWebRequest.Get(url);
            {
                yield return webRequest.SendWebRequest();

                if (webRequest.result != UnityWebRequest.Result.Success)
                {
                    Debug.LogError($"Error: {webRequest.error}");
                    yield break;
                }

                string data = webRequest.downloadHandler.text;
                Debug.Log($"Response data: {data}");
                GetActiveTournamentResponse activeTournamentResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<GetActiveTournamentResponse>(data);


                if(activeTournamentResponse.Id == 0)
                {
                    yield break;
                }

                gameName.text = $"Tournament {activeTournamentResponse.Name}";
                gameDescription.text = $"{activeTournamentResponse.StartDate} - {activeTournamentResponse.EndDate}";

                PlayerPrefs.SetInt("TournamentHealthPoints", activeTournamentResponse.HP);
                PlayerPrefs.SetInt("TournamentMovementSpeed", activeTournamentResponse.MP);
                PlayerPrefs.SetInt("TournamentShieldPoints", activeTournamentResponse.SP);

                PlayerPrefs.SetInt("TournamentKillActive", 0);
                PlayerPrefs.SetInt("TournamentKillValue", 0);
                PlayerPrefs.SetInt("TournamentSurviveActive", 0);
                PlayerPrefs.SetInt("TournamentSurviveValue", 0);

                foreach (QuestDetailsDto qestDetailsDto in activeTournamentResponse.QuestDetails)
                {
                    if(qestDetailsDto.TournamentType == TournamentType.Kill.ToString())
                    {
                        PlayerPrefs.SetInt("TournamentKillActive", 1);
                        PlayerPrefs.SetInt("TournamentKillValue", qestDetailsDto.Value);
                    }
                    else if (qestDetailsDto.TournamentType == TournamentType.Survive.ToString())
                    {
                        PlayerPrefs.SetInt("TournamentSurviveActive", 1);
                        PlayerPrefs.SetInt("TournamentSurviveValue", qestDetailsDto.Value);
                    }
                }
                PlayerPrefs.Save();
            }
        }
    }
}

using UnityEngine;
using UnityEngine.Networking;
using System;
using System.Collections;
using Assets.Scripts.UI.Authorization.Models;
using Assets.Scripts.SOArchitecture;

namespace Assets.Scripts.UI
{
    public class UIEndMission : MonoBehaviour
    {
        [SerializeField] private IntVariable enemiesKilled;
        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] private TournamentTrigger tournamentTrigger;
        [SerializeField] private GameObject resetButton;

        private void Awake()
        {
            if (questDataVariable.Value.IsTournament == true)
            {
                resetButton.SetActive(false);
            }
        }

        public void SendWinStatistics(bool isWin)
        {
            string investorTicket = GetInvestorTicket();
            if (string.IsNullOrEmpty(investorTicket))
            {
                return;
            }

            if (questDataVariable.Value.IsTournament == false)
            {
                return;
            }

            if (tournamentTrigger.GameCode == Guid.Empty)
            {
                return;
            }

            StartCoroutine(Finish(investorTicket, isWin));
        }

        private IEnumerator Finish(string ticket, bool isWin)
        {
            string url = $"https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard/FinishGame";
            using UnityWebRequest webRequest = UnityWebRequest.Post(url, $"{{\"isWin\":{isWin.ToString().ToLower()},\"kills\":{enemiesKilled.Value},\"ticket\":\"{ticket}\",\"gameCode\":\"{tournamentTrigger.GameCode}\"}}", "application/json");
            {
                yield return webRequest.SendWebRequest();

                if (webRequest.result != UnityWebRequest.Result.Success)
                {
                    tournamentTrigger.GameCode = Guid.Empty;
                    yield break;
                }

                string data = webRequest.downloadHandler.text;
                FinishGameResponse finishGameResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<FinishGameResponse>(data);
            }
        }

        private string GetInvestorTicket()
        {
            string[] args = Environment.GetCommandLineArgs();
            foreach (string arg in args)
            {
                if (arg.Contains("-InvestorTicket="))
                {
                    return arg.Replace("-InvestorTicket=", "");
                }
            }

            return string.Empty;
        }
    }
}

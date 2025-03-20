using Assets.Scripts.Manager;
using Assets.Scripts.UI.Authorization.Models;
using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Networking;

namespace Assets.Scripts.SOArchitecture
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Tournament/Trigger")]
    public class TournamentTrigger : ScriptableObject
    {
        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] public Guid GameCode;

        public void Init(GameManager instance)
        {
            GameCode = Guid.Empty;

            if(questDataVariable.Value.IsTournament == false)
            {
                return;
            }

            string investorTicket = GetInvestorTicket();

            if (String.IsNullOrEmpty(investorTicket) == false)
            {
                instance.StartCoroutine(BurnTicket(investorTicket)); 
            }
        }

        private IEnumerator BurnTicket(string ticket)
        {
            string url = $"https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard/StartGame";

            using UnityWebRequest webRequest = UnityWebRequest.Post(url, $"{{\"ticket\":\"{ticket}\"}}", "application/json");
            {
                yield return webRequest.SendWebRequest();

                if (webRequest.result != UnityWebRequest.Result.Success)
                {
                    GameCode = Guid.Empty;
                    yield break;
                }

                string data = webRequest.downloadHandler.text;
                StartGameResponse startGameResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<StartGameResponse>(data);

                GameCode = startGameResponse.GameCode;
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
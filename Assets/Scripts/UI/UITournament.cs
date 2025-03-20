using System;
using System.Collections;
using UnityEngine.Networking;
using UnityEngine;
using UnityEngine.UI;
using Assets.Scripts.UI.Authorization.Models;
using Extensions;

namespace Assets.Scripts.UI
{
    public class UITournament : MonoBehaviour
    {
        [SerializeField] private bool isDevelopment;
        [SerializeField] private UIButtonHandler buttonHandler;

        private void Awake()
        {
            buttonHandler.Button.interactable = false;
            InvestorVerificationProcess();
        }

        private void InvestorVerificationProcess()
        {
            if (isDevelopment)
            {
                SetTournamentButtonActive();
                return;
            }

            string investorTicket = GetInvestorTicket();

            if (String.IsNullOrEmpty(investorTicket) == false)
            {
                StartCoroutine(IsAnyTicketTournamentActive(investorTicket));
            }
        }

        private IEnumerator IsAnyTicketTournamentActive(string ticket)
        {
            string url = $"https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard/IsAnyTicketTournamentActive?Ticket={ticket}";

            using UnityWebRequest webRequest = UnityWebRequest.Get(url);
            {
                yield return webRequest.SendWebRequest();

                if (webRequest.result != UnityWebRequest.Result.Success)
                {
                    yield break;
                }

                string data = webRequest.downloadHandler.text;
                IsAnyTicketTournamentActiveResponse investorStatusResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<IsAnyTicketTournamentActiveResponse>(data);

                if (investorStatusResponse.IsActive)
                {
                    SetTournamentButtonActive();
                }
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

        private void SetTournamentButtonActive()
        {
            buttonHandler.Button.interactable = true;
            buttonHandler.ForceUpdateState();
        }
    }
}

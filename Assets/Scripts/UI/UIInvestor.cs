using Assets.Scripts.UI.Authorization;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.Networking;

namespace Assets.Scripts.UI
{
    public class UIInvestor : MonoBehaviour
    {
        private const string KEY_INVESTOR = "IS_INVESTOR";
        private const string ZEALY_LEVEL = "ZEALY_LEVEL";

        [SerializeField] private GameObject waitingUICanvas;
        [SerializeField] private bool isDevelopment;

        public void CloseGame()
        {
            #if UNITY_EDITOR
                UnityEditor.EditorApplication.isPlaying = false;
            #else
                Application.Quit();
            #endif
        }

        private void Awake()
        {
            InvestorVerificationProcess();
        }

        private void InvestorVerificationProcess()
        {
            if (isDevelopment)
            {
                PlayerPrefs.SetInt(KEY_INVESTOR, 1);
                PlayerPrefs.SetInt(ZEALY_LEVEL, 100);
                waitingUICanvas.SetActive(false);
                return;
            }
            else
            {
                PlayerPrefs.SetInt(ZEALY_LEVEL, 0);
                PlayerPrefs.SetInt(KEY_INVESTOR, 0);
            }

            string investorTicket = GetInvestorTicket();

            if (String.IsNullOrEmpty(investorTicket))
            {
                waitingUICanvas.SetActive(false);
            }
            else
            {
                StartCoroutine(UpdateZealyLevel(investorTicket));
                StartCoroutine(InvestorTicketVerification(investorTicket));
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

        private IEnumerator UpdateZealyLevel(string ticket)
        {
            byte[] requestJson = Encoding.UTF8.GetBytes($"{{\"Ticket\":\"{ticket}\"}}");

            string url = $"https://adriagames-mayhemtdsauthorization-api.azurewebsites.net/api/Achievement/GetLevel";

            using UnityWebRequest webRequest = UnityWebRequest.PostWwwForm(url, "POST");
            {
                webRequest.uploadHandler = new UploadHandlerRaw(requestJson);

                webRequest.SetRequestHeader("Content-Type", "application/json");
                yield return webRequest.SendWebRequest();

                if (webRequest.result == UnityWebRequest.Result.Success)
                {
                    JObject jObject = JObject.Parse(webRequest.downloadHandler.text);
                    JToken zealyLevelJToken = jObject.GetValue("level").Value<int>();

                    PlayerPrefs.SetInt(ZEALY_LEVEL, zealyLevelJToken.Value<int>());
                    yield break;
                }
            }
        }


        private IEnumerator InvestorTicketVerification(string ticket)
        {
            byte[] requestJson = Encoding.UTF8.GetBytes($"{{\"Ticket\":\"{ticket}\"}}");

            TicketEndoceService ticketEndoceService = new();
            string wallet = ticketEndoceService.DecodeTicket(ticket);

            if(string.IsNullOrEmpty(wallet))
            {
                waitingUICanvas.SetActive(false);
                yield break;
            }

            string url = $"https://adriagames-mayhemtdsauthorization-api.azurewebsites.net/api/Authorization/GetInvestorStatus?Wallet={wallet}";

            using UnityWebRequest webRequest = UnityWebRequest.Get(url);
            {
                webRequest.uploadHandler = new UploadHandlerRaw(requestJson);

                webRequest.SetRequestHeader("Content-Type", "application/json");
                yield return webRequest.SendWebRequest();

                if (webRequest.result != UnityWebRequest.Result.Success)
                {
                    waitingUICanvas.SetActive(false);
                    yield break;
                }

                string data = webRequest.downloadHandler.text;
                bool isInvestor = ticketEndoceService.DecodeInvestorStatus(data);

                if (isInvestor)
                {
                    PlayerPrefs.SetInt(KEY_INVESTOR, 1);
                }
            }
            waitingUICanvas.SetActive(false);
        }
    }
}
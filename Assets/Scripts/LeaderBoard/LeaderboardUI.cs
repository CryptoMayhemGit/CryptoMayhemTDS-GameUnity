using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DTT.Rankings.Runtime;
using UnityEngine.UI;
using System;
using System.Linq;
using UnityEngine.Networking;
using Assets.DTT.Rankings.Demo.Scripts.Models;
using Newtonsoft.Json;
using Assets.Scripts.UI.Authorization;

namespace DTT.Rankings.Demo
{
    /// <summary>
    /// Used to control the UI of the leaderboard implementation.
    /// </summary>
    public class LeaderboardUI : MonoBehaviour
    {
        /// <summary>
        /// Ledarboard configuration.
        /// </summary>
        [SerializeField]
        [Tooltip("Ledarboard configuration.")]
        private RankingSettings _settings;

        /// <summary>
        /// Parent object for the rows.
        /// </summary>
        [SerializeField]
        [Tooltip("Parent object of the rows.")]
        private GameObject _rowContainer;

        /// <summary>
        /// Parent object for pagination.
        /// </summary>
        [SerializeField]
        [Tooltip("Parent object for pagination.")]
        private GameObject _paginationObject;

        /// <summary>
        /// Rank prefab.
        /// </summary>
        [SerializeField]
        [Tooltip("Rank prefab.")]
        private RankObject _rankPrefab;

        /// <summary>
        /// Current player rank object.
        /// </summary>
        [SerializeField]
        [Tooltip("Current player rank object.")]
        private RankObject _currentRankObject;

        /// <summary>
        /// Rank prefab.
        /// </summary>
        [SerializeField]
        [Tooltip("Rank prefab.")]
        private Text _currentPageText;

        /// <summary>
        /// InputField for selecting the ammount of random entries.
        /// </summary>
        [SerializeField]
        [Tooltip("InputField for selecting the ammount of random entries.")]
        private InputField _entriesInput;

        /// <summary>
        /// Rows scroll rect components
        /// </summary>
        [SerializeField]
        [Tooltip("Rows scroll rect components.")]
        private ScrollRect _scrollRect;

        /// <summary>
        /// Collection for rank game objects.
        /// </summary>
        private List<RankObject> _rankObjects;

        /// <summary>
        /// All ranks.
        /// </summary>
        private Rank[] _rows;

        /// <summary>
        /// Leaderboard with normal ranks.
        /// </summary>
        private Leaderboard<Rank> _leaderboard;

        /// <summary>
        /// File location for normal ranks.
        /// </summary>
        private string PATH_RANK;

        private void OnEnable()
        {
            _paginationObject.SetActive(_settings.UsePagination);

            PATH_RANK = Application.persistentDataPath + "/RowsData.json";

            _rankObjects = new List<RankObject>();
            _leaderboard = new Leaderboard<Rank>(_settings.MaxRows, new RankingSaverJSON<Rank>());

            RefreshTable();
        }

        private void SetCurrentUser()
        {
            string ticket = GetInvestorTicket();

            if (string.IsNullOrEmpty(ticket) == false)
            {
                TicketEndoceService ticketEndoceService = new();
                string wallet = ticketEndoceService.DecodeTicket(ticket);
                _entriesInput.text = wallet;
                ChooseWallet();
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

        IEnumerator GetRequest(string uri)
        {
            using (UnityWebRequest webRequest = UnityWebRequest.Get(uri))
            {
                // Request and wait for the desired page.
                yield return webRequest.SendWebRequest();

                string[] pages = uri.Split('/');
                int page = pages.Length - 1;

                switch (webRequest.result)
                {
                    case UnityWebRequest.Result.ConnectionError:
                    case UnityWebRequest.Result.DataProcessingError:
                        break;
                    case UnityWebRequest.Result.ProtocolError:
                        break;
                    case UnityWebRequest.Result.Success:
                        {
                            StatsResponse statsResponse = JsonConvert.DeserializeObject<StatsResponse>(webRequest.downloadHandler.text);

                            List<Rank> rows = new() { };
                            int i = 0;
                            foreach (PlayerStatistic playerStatistic in statsResponse.PlayerStatistic)
                            {
                                rows.Add(new Rank(i, $"{playerStatistic.Wallet.Substring(0, 6)}...{playerStatistic.Wallet.Substring(playerStatistic.Wallet.Length - 4)}", playerStatistic.Points, playerStatistic.Change, playerStatistic.Win + playerStatistic.Lose, $"{playerStatistic.Win} / {playerStatistic.Lose}", playerStatistic.Kills, playerStatistic.Order, playerStatistic.Wallet));
                                i++;
                            }

                            _rows = rows.ToArray();
                            _leaderboard.AddRows(PATH_RANK, _rows);
                            _currentPageText.text = $"1 / {_leaderboard.TotalPages}";
                            _leaderboard.LoadData(PATH_RANK);
                            ClearTable();
                            CreateTable(_rows.ToList());
                            FirstPage();
                            SetCurrentUser();

                            break;
                        }
                }
            }
        }

        private void OnDisable()
        {
            ClearTable();
            _currentRankObject.gameObject.SetActive(false);
        }

        /// <summary>
        /// Fills the leaderboard with ranks.
        /// </summary>
        public void RefreshTable()
        {
            ClearTable();
            StartCoroutine(GetRequest("https://adriagames-mayhemleaderboard-api.azurewebsites.net/LeaderBoard"));
        }

        /// <summary>
        /// Sorts the ranks by wallet.
        /// </summary>
        public void SortByWallet()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedAscending(x => x.Wallet);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the ranks by rank.
        /// </summary>
        public void SortByRank()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedAscending(x => x.RankPosition);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the rank by score.
        /// </summary>
        public void SortByScore()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedDescending(x => x.Score);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the rank by 25 hour change.
        /// </summary>
        public void SortByChange()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedDescending(x => x.Change);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the rank by total games.
        /// </summary>
        public void SortByTotalGames()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedDescending(x => x.TotalGames);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the rank by mission sum.
        /// </summary>
        public void SortByMissionSum()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedDescending(x => x.MissionSum);
            CreateTable(sortedRankings);
        }

        /// <summary>
        /// Sorts the rank by kills.
        /// </summary>
        public void SortByKills()
        {
            ClearTable();
            List<Rank> sortedRankings = _leaderboard.GetCurrentPageRankingsSortedDescending(x => x.Kills);
            CreateTable(sortedRankings);
        }

        private void CreateTable(List<Rank> sortedRankings)
        {
            foreach (Rank rank in sortedRankings)
            {
                RankObject rankObject = Instantiate(_rankPrefab, _rowContainer.transform, false);
                rankObject.SetData(rank.Id, rank.RankPosition, rank.Wallet, rank.Score, rank.Change, rank.TotalGames, rank.MissionSum, rank.Kills);
                _rankObjects.Add(rankObject);
            }
        }

        /// <summary>
        /// Displays the next page.
        /// </summary>
        public void NextPage()
        {
            _leaderboard.NextPage();
            ClearTable();

            foreach (Rank rank in _leaderboard.Rankings)
            {
                RankObject rankObject = Instantiate(_rankPrefab, _rowContainer.transform, false);
                rankObject.SetData(rank.Id, rank.RankPosition, rank.Wallet, rank.Score, rank.Change, rank.TotalGames, rank.MissionSum, rank.Kills);
                _rankObjects.Add(rankObject);
            }

            _scrollRect.verticalNormalizedPosition = 1;
        }

        /// <summary>
        /// Displays the previous page.
        /// </summary>
        public void PreviousPage()
        {
            _leaderboard.PreviousPage();
            ClearTable();

            foreach (Rank rank in _leaderboard.Rankings)
            {
                RankObject rankObject = Instantiate(_rankPrefab, _rowContainer.transform, false);
                rankObject.SetData(rank.Id, rank.RankPosition, rank.Wallet, rank.Score, rank.Change, rank.TotalGames, rank.MissionSum, rank.Kills);
                _rankObjects.Add(rankObject);
            }

            _scrollRect.verticalNormalizedPosition = 1;
        }

        /// <summary>
        /// Displays the first page.
        /// </summary>
        public void FirstPage()
        {
            _leaderboard.FirstPage();
            ClearTable();

            foreach (Rank rank in _leaderboard.Rankings)
            {
                RankObject rankObject = Instantiate(_rankPrefab, _rowContainer.transform, false);
                rankObject.SetData(rank.Id, rank.RankPosition, rank.Wallet, rank.Score, rank.Change, rank.TotalGames, rank.MissionSum, rank.Kills);
                _rankObjects.Add(rankObject);
            }

            _scrollRect.verticalNormalizedPosition = 1;
        }

        /// <summary>
        /// Sets the current player rank information based on the chosen Wallet.
        /// </summary>
        public void ChooseWallet()
        {
            if (string.IsNullOrEmpty(_entriesInput.text))
            {
                _currentRankObject.gameObject.SetActive(false);
                return;
            }

            Rank rank = _rows.SingleOrDefault(x => x.FullWallet == _entriesInput.text);

            if (rank != null)
            {
                _currentRankObject.gameObject.SetActive(true);
                _currentRankObject.SetData(rank.Id, rank.RankPosition, rank.Wallet, rank.Score, rank.Change, rank.TotalGames, rank.MissionSum, rank.Kills);
            }
            else
            {
                _currentRankObject.gameObject.SetActive(false);
            }
        }

        /// <summary>
        /// Destroys all rank game objects and clears the list. 
        /// </summary>
        private void ClearTable()
        {
            if (_leaderboard.TotalPages > 0)
                _currentPageText.text = $"{_leaderboard.CurrentPage} / {_leaderboard.TotalPages}";

            foreach (RankObject rank in _rankObjects)
                Destroy(rank.gameObject);

            _rankObjects.Clear();
        }
    }
}

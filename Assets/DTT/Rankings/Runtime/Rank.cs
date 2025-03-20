using System;

namespace DTT.Rankings.Runtime
{
    /// <summary>
    /// Rank entity. Custom rankings must derive from this class.
    /// </summary>
    [Serializable]
    public class Rank
    {
        /// <summary>
        /// Rank ID.
        /// </summary>
        public int _id;

        /// <summary>
        /// Player rank.
        /// </summary>
        public int _rankPosition;

        /// <summary>
        /// Player name.
        /// </summary>
        public string _wallet;

        /// <summary>
        /// Final wallet.
        /// </summary>
        public int _score;

        /// <summary>
        /// 24 hour change.
        /// </summary>
        public int _change;

        /// <summary>
        /// Total games.
        /// </summary>
        public int _totalGames;

        /// <summary>
        /// Mission sum.
        /// </summary>
        public string _missionSum;

        /// <summary>
        /// Full wallet.
        /// </summary>
        public string _fullWallet;

        /// <summary>
        /// Kills.
        /// </summary>
        public int _kills;

        /// <summary>
        /// Rank ID.
        /// </summary>
        public int Id => _id;

        /// <summary>
        /// Player rank.
        /// </summary>
        public int RankPosition => _rankPosition;

        /// <summary>
        /// Player wallet.
        /// </summary>
        public string Wallet => _wallet;

        /// <summary>
        /// Full wallet.
        /// </summary>
        public string FullWallet => _fullWallet;

        /// <summary>
        /// Final score.
        /// </summary>
        public int Score => _score;

        /// <summary>
        /// 24 hours change.
        /// </summary>
        public int Change => _change;

        /// <summary>
        /// Total games.
        /// </summary>
        public int TotalGames => _totalGames;

        /// <summary>
        /// Mission sum.
        /// </summary>
        public string MissionSum => _missionSum;

        /// <summary>
        /// Kills.
        /// </summary>
        public int Kills => _kills;

        /// <summary>
        /// Initializes the rank with the given data.
        /// </summary>
        /// <param name="id">Rank ID.</param>
        /// <param name="wallet">Player wallet.</param>
        /// <param name="score">Player score.</param>
        public Rank(int id, string wallet, int score, int change, int totalGames, string missionSum, int kills, int rankPosition, string fullWallet)
        {
            _id = id;
            _wallet = wallet;
            _score = score;
            _change = change;
            _totalGames = totalGames;
            _missionSum = missionSum;
            _kills = kills;
            _rankPosition = rankPosition;
            _fullWallet = fullWallet;
        }

        /// <summary>
        /// Returns a string with all rank details.
        /// </summary>
        public override string ToString() => $"ID: {_id} Rank: {_rankPosition} Wallet: {_wallet} Score: {_score} Change: {_change} TotalGames: {_totalGames} MissionSum: {_missionSum} Kills: {_kills}";
    }
}

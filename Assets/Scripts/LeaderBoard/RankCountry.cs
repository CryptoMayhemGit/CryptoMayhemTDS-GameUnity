using System;
using DTT.Rankings.Runtime;

namespace DTT.Rankings.Demo
{
    /// <summary>
    /// Custom ranking with a country field.
    /// </summary>
    [Serializable]
    public class RankCountry : Rank
    {
        /// <summary>
        /// Player country.
        /// </summary>
        public string _country;

        /// <summary>
        /// Player country.
        /// </summary>
        public string Country => _country;

        /// <summary>
        /// Initializes the rank with the given data.
        /// </summary>
        /// <param name="id">Rank ID.</param>
        /// <param name="wallet">Player wallet.</param>
        /// <param name="score">Player score.</param>
        /// <param name="country">Player country.</param>
        /// <param name="Change">Player 24 hour change.</param>
        public RankCountry(int id, string wallet, int score, string country, int Change, int TotalGames, string MissionSum, int Kills, int rankPosition, string fullWallet) : base(id, wallet, score, Change, TotalGames, MissionSum, Kills, rankPosition, fullWallet) => _country = country;

        /// <summary>
        /// Returns a string with all rank details.
        /// </summary>
        public override string ToString() => $"ID: {Id} Rank: {RankPosition} Wallet: {Wallet} Score: {Score} Country: {_country}, Change {_change}";
    }
}

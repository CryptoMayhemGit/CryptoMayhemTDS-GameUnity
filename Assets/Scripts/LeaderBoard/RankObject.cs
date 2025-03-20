using System.Text.RegularExpressions;
using UnityEngine;
using UnityEngine.UI;

namespace DTT.Rankings.Demo
{
    /// <summary>
    /// UI object for each ranking.
    /// </summary>
    public class RankObject : MonoBehaviour
    {
        [SerializeField]
        private Color positiveNumberColor;

        [SerializeField]
        private Color negativeNumberColor;

        [SerializeField]
        private Color zeroColor;

        /// <summary>
        /// Rank ID.
        /// </summary>
        private int _id;

        /// <summary>
        /// Text for the rank.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for rank position.")]
        private Text _rankText;

        /// <summary>
        /// Text for player wallet.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for player wallet.")]
        private Text _walletText;

        /// <summary>
        /// Text for player score.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for player score.")]
        private Text _scoreText;

        /// <summary>
        /// Text for player 24 hour change.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for 24 hour change.")]
        private Text _changeText;

        /// <summary>
        /// Text for player total games.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for 24 hour change.")]
        private Text _totalGamesText;

        /// <summary>
        /// Text for player mission sum.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for mussion sum.")]
        private Text _missionSumText;

        /// <summary>
        /// Text for player mission sum.
        /// </summary>
        [SerializeField]
        [Tooltip("Text for kills.")]
        private Text _killsText;

        /// <summary>
        /// Rank ID.
        /// </summary>
        public int Id => _id;

        /// <summary>
        /// Sets all the data on the rank object.
        /// </summary>
        /// <param name="id">Rank ID.</param>
        /// <param name="wallet">Player wallet.</param>
        /// <param name="score">Player score.</param>
        /// <param name="change">Player 24 hour change.</param>
        /// <param name="totalGames">Player 24 total games.</param>
        public void SetData(int id, int rank, string wallet, int score, int change, int totalGames, string missionSum, int kills)
        {
            _id = id;
            _rankText.text = $"{rank}";
            _walletText.text = wallet;
            _scoreText.text = $"{score}";
            _changeText.text = change > 0 ? $"+{change}" : $"{change}";
            _totalGamesText.text = $"{totalGames}";
            _missionSumText.text = missionSum;
            _killsText.text = $"{kills}";

            SetChangeColor(change);
            SetMissionSumColor(missionSum);
        }

        private void SetChangeColor(int change)
        {
            if(change > 0)
            {
                _changeText.color = positiveNumberColor;
            }
            else if(change < 0)
            {
                _changeText.color = negativeNumberColor;
            }
            else
            {
                _changeText.color = zeroColor;
            }
        }

        private void SetMissionSumColor(string missionSum)
        {
            int winGames = int.Parse(RemoveWhitespaces(missionSum.Split('/')[0]));
            int loseGames = int.Parse(RemoveWhitespaces(missionSum.Split('/')[1]));

            _missionSumText.text = $"<color=#{GetWinNumberRGBA(winGames)}>{winGames}</color> / <color=#{GetLoseNumberRGBA(loseGames)}>{loseGames}</color>";
        }

        public string GetWinNumberRGBA(int numberToCheck)
        {
            if (numberToCheck > 0)
            {
                return ColorUtility.ToHtmlStringRGBA(positiveNumberColor);
            }
            else
            {
                return ColorUtility.ToHtmlStringRGBA(zeroColor);
            }
        }

        public string GetLoseNumberRGBA(int numberToCheck)
        {
            if (numberToCheck > 0)
            {
                return ColorUtility.ToHtmlStringRGBA(negativeNumberColor);
            }
            else
            {
                return ColorUtility.ToHtmlStringRGBA(zeroColor);
            }
        }

        public string RemoveWhitespaces(string source)
        {
            return Regex.Replace(source, @"\s", string.Empty);
        }
    }
}


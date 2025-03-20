using System.Collections.Generic;
using System;

namespace Assets.Scripts.UI.Authorization.Models
{
    public class GetActiveTournamentResponse
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string TournamentWalletOwner { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsFinished { get; set; }
        public DateTime CreateDate { get; set; }
        public int HP { get; set; }
        public int SP { get; set; }
        public int MP { get; set; }

        public List<QuestDetailsDto> QuestDetails { get; set; }
    }

    public class TournamentUserStatisticsDto
    {
        public int Id { get; set; }
        public string Wallet { get; set; }
        public bool IsWin { get; set; }
        public int Kills { get; set; }
        public DateTime CreateDate { get; set; }

        public int TournamentId { get; set; }
    }

    public class QuestDetailsDto
    {
        public string TournamentType { get; set; }
        public int Value { get; set; }
    }

    public enum TournamentType
    {
        None = 0,
        Survive = 1,
        Kill = 2,
    }
}

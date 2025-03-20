using Assets.Scripts.UI.Authorization.Models;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using static TagsMain;

namespace Assets.Scripts.Questlog
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Quest/QuestData")]
    public class QuestData : ScriptableObject
    {
        [field: SerializeField] public GameObject MapConfiguration { private set; get; } = null;
        [field: SerializeField] public TextAsset NavigationData { private set; get; } = null;
        [field: SerializeField] public QuestInfo QuestInfo { private set; get; } = new();
        [field: SerializeField] public string SceneName { private set; get; }
        [field: SerializeField] public bool IsInvestorPremiumMode { private set; get; }
        [field: SerializeField] public int ZealyRequiredLevel { private set; get; }
        [field: SerializeField] public bool IsTournament { private set; get; }
        [field: SerializeField] public TaskData taskDataKill = null;
        [field: SerializeField] public TaskData taskDataSurvive = null;
        [field: SerializeField] public GameObject UIPrefab = null;

        [SerializeField, Space] public List<TaskParametersContainer> successTaskAmountContainer = new();
        [SerializeField] private List<TaskParametersContainer> failTaskAmountContainer = new();

        public IReadOnlyList<TaskParametersContainer> SuccessTasks
        {
            get
            {
                if(IsTournament)
                {
                    List<TaskParametersContainer> tournamentTaskParametersContainerList = new List<TaskParametersContainer>();

                    int tournamentKillActive = PlayerPrefs.GetInt("TournamentKillActive", 0);
                    int tournamentKillValue = PlayerPrefs.GetInt("TournamentKillValue", 0);
                    int tournamentSurviveActive = PlayerPrefs.GetInt("TournamentSurviveActive", 0);
                    int tournamentSurviveValue = PlayerPrefs.GetInt("TournamentSurviveValue", 0);

                    tournamentTaskParametersContainerList.Clear();
                    if (tournamentKillActive == 1)
                    {
                        TaskParametersContainer taskParametersContainer = new TaskParametersContainer();
                        taskParametersContainer.TaskData = taskDataKill;
                        taskParametersContainer.RequiredAmount = tournamentKillValue;
                        taskParametersContainer.UIPrefab = UIPrefab;
                        tournamentTaskParametersContainerList.Add(taskParametersContainer);
                    }

                    if (tournamentSurviveActive == 1)
                    {
                        TaskParametersContainer taskParametersContainer = new TaskParametersContainer();
                        taskParametersContainer.TaskData = taskDataSurvive;
                        taskParametersContainer.RequiredAmount = tournamentSurviveValue;
                        taskParametersContainer.UIPrefab = UIPrefab;
                        tournamentTaskParametersContainerList.Add(taskParametersContainer);
                    }

                    return tournamentTaskParametersContainerList;
                }
                else
                {
                    return successTaskAmountContainer;
                }
            }
        }

        public IReadOnlyList<TaskParametersContainer> FailTasks => failTaskAmountContainer;
    }
}
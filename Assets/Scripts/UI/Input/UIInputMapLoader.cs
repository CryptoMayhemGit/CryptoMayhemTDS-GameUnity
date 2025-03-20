using Assets.Scripts.SOArchitecture;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Assets.Scripts.UI.Input
{
    public class UIInputMapLoader : MonoBehaviour
    {
        [SerializeField] private QuestDataVariable mainQuestData = null;

        public void RestartSceneAsync()
        {
            StartCoroutine(LoadSceneAsync());
        }

        IEnumerator LoadSceneAsync()
        {
            AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(mainQuestData.Value.SceneName);

            while (!asyncLoad.isDone)
            {
                yield return null;
            }
        }
    }
}
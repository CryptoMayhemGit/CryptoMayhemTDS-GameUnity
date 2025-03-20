using Assets.Scripts.SOArchitecture;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Assets.Scripts.Scene
{
    public class SceneLoaderManager : MonoBehaviour
    {
        [SerializeField] private GameEvent onSceneLoadedStart = null;
        [SerializeField] private FloatEvent onSceneLoading = null;
        [SerializeField] private QuestDataVariable mainQuestData = null;

        [Tooltip("Loading percentage ranges. Should be added from the smallest to the largest in the range from 0f to 0.8f. x - initial value, y - final value. The last 0.2% is left for the actual charging state.")]
        [SerializeField] private List<Vector2> loadingRanges = null;
        [Tooltip("Required time to move on to the next progress of the progress bar.")]
        [SerializeField] private float waitTime = 0.5f;

        public void LoadScene()
        {
            onSceneLoadedStart.Raise();
            StartCoroutine(LoadSceneAsync());
        }

        private IEnumerator LoadSceneAsync()
        {
            foreach (Vector2 loadingRange in loadingRanges)
            {
                onSceneLoading.Raise(Random.Range(loadingRange.x, loadingRange.y));
                yield return new WaitForSeconds(waitTime);
            }

            AsyncOperation asyncOperation = SceneManager.LoadSceneAsync(mainQuestData.Value.SceneName);

            while (!asyncOperation.isDone)
            {
                float progressValue = GetProgressValue(asyncOperation);
                onSceneLoading.Raise(progressValue);

                yield return null;
            }
        }

        private float GetProgressValue(AsyncOperation asyncOperation)
        {
            var lastPercentage = asyncOperation.progress * 0.2f;

            float progressValue = lastPercentage + 0.8f;
            return progressValue;
        }
    }
}

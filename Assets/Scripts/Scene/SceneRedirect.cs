using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace Assets.Scripts.Scene
{
    public class SceneRedirect : MonoBehaviour
    {
        public void LoadSelectedSceneAsync(string name)
        {
            StartCoroutine(LoadSceneAsync(name));
        }

        public void SetTimeScale(float time)
        {
            Time.timeScale = time;
        }

        private IEnumerator LoadSceneAsync(string name)
        {
            AsyncOperation asyncOperation = SceneManager.LoadSceneAsync(name);

            while (!asyncOperation.isDone)
            {
                yield return null;
            }
        }
    }
}

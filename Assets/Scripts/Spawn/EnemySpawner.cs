using System.Collections;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Spawn
{
    public class EnemySpawner : MonoBehaviour
    {
        [SerializeField] private Transform spawnerTransform = null;
        [SerializeField] private SOArchitecture.PlayerContainerVariable playerContainerVariable = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null; //In multiplayer must use network update
        [SerializeField] private Pooling.EnemyContainerPool pool = null;
        [SerializeField, Min(0.1f)] private float spawnCooldown = 0.1f;
        [SerializeField, Min(1)] private int perSpawnQuantity = 1;
        [SerializeField] private Collider visualBoundsCollider;
        [SerializeField] private int waitForSecondsForStart = 5;
        [SerializeField] private float distanceFromPlayer = 30f;

        private float timeToNextSpawn;

        private void Start()
        {
            StartCoroutine(ExampleCoroutine());
        }

        IEnumerator ExampleCoroutine()
        {
            yield return new WaitForSeconds(waitForSecondsForStart);

            visualBoundsCollider.enabled = true;
        }

        //Unpredictable behavior in multiplayer
        private void OnTriggerEnter(Collider other)
        {
            TryStartTimer();
        }

        private void OnTriggerExit(Collider other)
        {
            TryStopTimer();
        }

        private void TryStartTimer()
        {
            gameManager.Value.OnUpdate += SpawnEnemyTimer;
        }

        private void TryStopTimer()
        {
            gameManager.Value.OnUpdate -= SpawnEnemyTimer;
        }

        private void SpawnEnemyTimer()
        {

            if (playerContainerVariable.Value == null)
            {
                TryStopTimer();
                return;
            }

            Profiler.BeginSample("EnemySpawner.SpawnEnemyTimer");
            if (Time.time >= timeToNextSpawn)
            {

                if (IsPlayerColse())
                {
                    timeToNextSpawn = Time.time + (spawnCooldown / 2);
                    return;
                }
                else
                {
                    timeToNextSpawn = Time.time + spawnCooldown;
                }

                for (int i = 0; i < perSpawnQuantity; i++)
                    EnemySpawnHelper.SpawnEnemy(pool, spawnerTransform, Vector3.zero);
            }
            Profiler.EndSample();
        }

        private bool IsPlayerColse()
        {

            if (playerContainerVariable.Value == null)
            {
                return true;
            }

            return Vector3.Distance(playerContainerVariable.Value.Movement.transform.position, transform.position) <= distanceFromPlayer;
        }
    }
}
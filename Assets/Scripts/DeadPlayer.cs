using Assets.Scripts.Inventory;
using Assets.Scripts.SOArchitecture;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts
{
    public class DeadPlayer : MonoBehaviour
    {
        [SerializeField] private GameManagerVariable gameManager = null;
        [SerializeField] private PlayerInventory inventory = null;
        [SerializeField] private Transform rightSocket = null;
        [SerializeField] private Transform leftSocket = null;
        [SerializeField] private GameEvent onPlayerDeath = null;
        [SerializeField] private float deathTimer = 0f;

        private float timer;

        private void Awake()
        {
            Instantiate(inventory.MainWeapon.GetWeaponVisual(), rightSocket);
            Instantiate(inventory.SecondWeapon.GetWeaponVisual(), leftSocket);
            timer = 0f;
            gameManager.Value.OnUpdate += TimeTick;
        }

        private void TimeTick()
        {
            Profiler.BeginSample("DeadPlayer.TimeTick");
            if ((timer += Time.deltaTime) >= deathTimer)
            {
                gameManager.Value.OnUpdate -= TimeTick;
                onPlayerDeath.Raise();
            }
            Profiler.EndSample();
        }
    }
}
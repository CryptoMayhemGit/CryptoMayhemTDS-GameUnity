using Assets.Scripts.Containers;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.UI
{
    public class UIBossHealthBox : MonoBehaviour
    {
        [SerializeField] private BasicContainerList bossList = null;
        [SerializeField] private List<UIBossBar> bossBarList = new();

        private void OnEnable()
        {
            bossList.AddOnAddListener(AddBossHealthBar);
            bossList.AddOnRemoveListener(RemoveBossHealthBar);
        }

        private void OnDisable()
        {
            bossList.RemoveOnAddListener(AddBossHealthBar);
            bossList.RemoveOnRemoveListener(RemoveBossHealthBar);
        }

        private void AddBossHealthBar(CharacterContainer container)
        {
            foreach (UIBossBar bar in bossBarList)
            {
                if (!bar.gameObject.activeSelf)
                {
                    bar.Init(container);
                    bar.gameObject.SetActive(true);
                    return;
                }
            }
        }

        private void RemoveBossHealthBar(CharacterContainer container)
        {
            foreach (UIBossBar bar in bossBarList)
            {
                if (bar.Container == container)
                {
                    bar.gameObject.SetActive(false);
                    return;
                }
            }
        }
    }
}
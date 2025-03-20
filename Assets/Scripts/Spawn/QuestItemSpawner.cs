using System.Collections.Generic;
using UnityEngine;

public class QuestItemSpawner : MonoBehaviour
{
    [SerializeField] private List<GameObject> objects = new();

    public void SpawnRescueMissionObjects(int number)
    {
        for (int i = 0; i < Mathf.Min(number, 10); i++)
        {
            objects[i].SetActive(true);
        }
    }
}

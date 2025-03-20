using UnityEngine;
using Assets.Scripts.SOArchitecture;

namespace Assets.Scripts.UI
{
    public class UIMenu : MonoBehaviour
    {
        [SerializeField] private QuestDataVariable questDataVariable = null;
        [SerializeField] public GameObject ObjectToDisable;

        private void Awake()
        {
            if(questDataVariable.Value.IsTournament)
            {
                ObjectToDisable.SetActive(false);
            }
        }
    }
}

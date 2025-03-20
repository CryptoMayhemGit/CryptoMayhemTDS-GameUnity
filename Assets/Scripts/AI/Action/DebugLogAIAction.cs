using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    public class DebugLogAIAction : AIAction
    {
        [SerializeField] private string textStart = "On Start";
        [SerializeField] private string textUpdate = "On Update";
        [SerializeField] private string textEnd = "On End";

        public override void OnStart(CharacterContainer character)
        {
            Debug.Log(textStart);
        }

        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {
            Debug.Log(textUpdate);
        }

        public override void OnEnd(CharacterContainer character)
        {
            Debug.Log(textEnd);
        }
    }
}
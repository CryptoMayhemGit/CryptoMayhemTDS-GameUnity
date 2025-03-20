using UnityEngine;
using Assets.Scripts.Containers;

namespace Assets.Scripts.AI.Action
{
    public class GrowAction : AIAction
    {
        [SerializeField] private float time = 5;
        [SerializeField] private float startScale = .1f;
        [SerializeField] private float endScale = 1;

        public override void OnStart(CharacterContainer character)
        {
            character.Transform.localScale = Vector3.one * startScale;

            var enemy = ((EnemyContainer)character);
            enemy.RichAI.destination = enemy.Transform.position;
            enemy.RichAI.SetPath(null);
        }

        public override void OnUpdate(CharacterContainer character, float elapsedTime)
        {
            character.Transform.localScale = Vector3.one * Mathf.Lerp(startScale, endScale, elapsedTime / time);
        }

        public override void OnEnd(CharacterContainer character)
        {
            character.Transform.localScale = Vector3.one * endScale;
        }
    }
}
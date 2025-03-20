using UnityEngine;

namespace Assets.Scripts.Sound
{
    public class EnemySounds : CharacterSounds
    {
        [SerializeField, Space] private SoundsHolder argoSound = null;

        public void PlayAgro()
        {
            argoSound.Play(character.Transform.position);
        }
    }
}
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Sound
{
    public class PlayerSounds : CharacterSounds
    {
        [SerializeField, Space] private SoundsHolder powerdownSound = default;
        [SerializeField, Space] private SoundsHolder landLoopSound = default;
        [SerializeField, Space] private SoundsHolder landEndSound = default;
        [SerializeField, Space] private List<SoundsHolder> randomSound = new List<SoundsHolder>();

        public void PlayPowerdown()
        {
            powerdownSound.Play(character.Transform.position);
        }

        public void PlayLandEnd()
        {
            landEndSound.Play(character.Transform.position);
        }

        public void StartRandomSound()
        {
            var randomStartDelay = Random.Range(5f, 20f);
            var randomRepeatingDelay = Random.Range(30f, 60f);
            InvokeRepeating(nameof(PlayRandomSound), randomStartDelay, randomRepeatingDelay);
        }

        public void StopRandomSound()
        {
            CancelInvoke(nameof(PlayRandomSound));
        }

        private void PlayRandomSound()
        {
            var randomValue = Random.Range(0, randomSound.Count);
            randomSound[randomValue].Play(character.Transform.position);
        }
    }
}
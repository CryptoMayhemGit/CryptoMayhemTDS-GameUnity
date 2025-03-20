using FMODUnity;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Sound
{
    [System.Serializable]
    public class SoundsHolder
    {
        [SerializeField] private Sound[] sounds;

        private FMOD.Studio.EventInstance[] instances = null;

        public void Play(Vector3 position)
        {
            for (var i = 0; i < sounds.Length; i++)
            {
                if(sounds[i].soundEvent.IsNull == true)
                {
                    continue;
                }

                if (sounds[i].randomly == false)
                    RuntimeManager.PlayOneShot(sounds[i].soundEvent, position);
                else
                    if (Random.value < sounds[i].chance)
                    RuntimeManager.PlayOneShot(sounds[i].soundEvent, position);
            }
        }

        // public void PlayAsInstance(Vector3 position)
        // {
        //     instances = new FMOD.Studio.EventInstance[sounds.Length];

        //     for (var i = 0; i < instances.Length; i++)
        //     {
        //         instances[i] = FMODUnity.RuntimeManager.CreateInstance(sounds[i].soundEvent);
        //         instances[i].start();
        //         instances[i].release();
        //     }
        // }

        // public void StopAsInstance()
        // {
        //     if (instances == null)
        //         return;

        //     for (var i = 0; i < instances.Length; i++)
        //         instances[i].stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);

        //     instances = null;
        // }
    }

    [System.Serializable]
    internal class Sound
    {
        [field: SerializeField] public EventReference soundEvent;
        [field: SerializeField] public bool randomly = false;
        [field: SerializeField, Range(0, 1), HideIf("@randomly == false")] public float chance;
    }
}
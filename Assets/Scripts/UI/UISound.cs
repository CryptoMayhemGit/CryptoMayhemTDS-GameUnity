using FMOD.Studio;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UISound : MonoBehaviour
    {
        private const string SOUND_MASTER = "SOUND_MASTER";
        private const string SOUND_MUSIC = "SOUND_MUSIC";
        private const string SOUND_SFX = "SOUND_SFX";
        private const string SOUND_UI = "SOUND_UI";

        [SerializeField] private Slider masterSlider = null;
        [SerializeField] private Slider musicSlider = null;
        [SerializeField] private Slider sfxSlider = null;
        [SerializeField] private Slider uiSlider = null;

        private Bus master;
        private Bus music;
        private Bus sfx;
        private Bus ui;

        public void Init()
        {
            master = FMODUnity.RuntimeManager.GetBus("bus:/Master");
            music = FMODUnity.RuntimeManager.GetBus("bus:/Master/Music");
            sfx = FMODUnity.RuntimeManager.GetBus("bus:/Master/SFX");
            ui = FMODUnity.RuntimeManager.GetBus("bus:/Master/UI");

            LoadSoundSettings();
        }

        private void OnEnable()
        {
            master.getVolume(out float masterVolume);
            masterSlider.value = masterVolume;

            music.getVolume(out float musicVolume);
            musicSlider.value = musicVolume;

            sfx.getVolume(out float sfxVolume);
            sfxSlider.value = sfxVolume;

            ui.getVolume(out float uiVolume);
            uiSlider.value = uiVolume;

            masterSlider.onValueChanged.AddListener((x) => ChangeVolume(ref master, masterSlider.value));
            musicSlider.onValueChanged.AddListener((x) => ChangeVolume(ref music, musicSlider.value));
            sfxSlider.onValueChanged.AddListener((x) => ChangeVolume(ref sfx, sfxSlider.value));
            uiSlider.onValueChanged.AddListener((x) => ChangeVolume(ref ui, uiSlider.value));
        }

        private void OnDisable()
        {
            masterSlider.onValueChanged.RemoveAllListeners();
            musicSlider.onValueChanged.RemoveAllListeners();
            sfxSlider.onValueChanged.RemoveAllListeners();
            uiSlider.onValueChanged.RemoveAllListeners();
            SaveSoundSettings();
        }

        private void ChangeVolume(ref Bus bus, float value)
        {
            bus.setVolume(value);
            SaveSoundSettings();
        }

        private void SaveSoundSettings()
        {
            master.getVolume(out var masterVolume);
            PlayerPrefs.SetFloat(SOUND_MASTER, masterVolume);

            music.getVolume(out var musicVolume);
            PlayerPrefs.SetFloat(SOUND_MUSIC, musicVolume);

            sfx.getVolume(out var sfxVolume);
            PlayerPrefs.SetFloat(SOUND_SFX, sfxVolume);

            ui.getVolume(out var uiVolume);
            PlayerPrefs.SetFloat(SOUND_UI, uiVolume);
        }

        private void LoadSoundSettings()
        {
            if (PlayerPrefs.HasKey(SOUND_MASTER))
                master.setVolume(PlayerPrefs.GetFloat(SOUND_MASTER));
            if (PlayerPrefs.HasKey(SOUND_MUSIC))
                music.setVolume(PlayerPrefs.GetFloat(SOUND_MUSIC));
            if (PlayerPrefs.HasKey(SOUND_SFX))
                sfx.setVolume(PlayerPrefs.GetFloat(SOUND_SFX));
            if (PlayerPrefs.HasKey(SOUND_UI))
                ui.setVolume(PlayerPrefs.GetFloat(SOUND_UI));
        }
    }
}
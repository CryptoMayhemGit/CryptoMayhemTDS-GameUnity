using UnityEngine;
using System.Linq;
using System.Collections.Generic;

namespace Assets.Scripts.Settings
{
    public class SettingGraphicResolution
    {
        private const string Resolution_Key = "Resolution_{0}";
        private const string Resolution_Separator = " X ";

        private List<Resolution> resolutions;
        private TMPro.TMP_Dropdown dropdown;

        public void Init(TMPro.TMP_Dropdown resolutionDropdown)
        {
            dropdown = resolutionDropdown;
            Refresh();
        }

        public void Refresh()
        {
            resolutions = GetSortedScreenResolutionsList();
            var lastSelectedResolution = PlayerPrefs.GetString(GetPrefsKey(), string.Empty);

            dropdown.ClearOptions();
            dropdown.AddOptions(resolutions.Select(x => GetFormatedResolutionString(x.width, x.height)).ToList());

            if (CanFindResolutionIndex(lastSelectedResolution, ref resolutions, out var index))
            {
                if (index != -1)
                {
                    SetResolution(resolutions[index].width, resolutions[index].height);   

                    dropdown.value = index;
                }
                else
                {
                    SetResolution(resolutions[^1].width, resolutions[^1].height);

                    dropdown.value = resolutions.Count - 1;
                }
            }
            else
                dropdown.value = resolutions.Count - 1;
        }

        public void SetResolution(int index)
        {
            Screen.SetResolution(resolutions[index].width, resolutions[index].height, FullScreenMode.ExclusiveFullScreen);
            PlayerPrefs.SetString(GetPrefsKey(), $"{resolutions[index].width} X {resolutions[index].height}");
        }

        private void SetResolution(int width, int height)
        {
            Screen.SetResolution(width, height, FullScreenMode.ExclusiveFullScreen);
            PlayerPrefs.SetString(GetPrefsKey(), $"{width} X {height}");
        }

        private bool CanFindResolutionIndex(string savedString, ref List<Resolution> resolutions, out int index)
        {
            index = -1;

            if (!string.IsNullOrEmpty(savedString))
            {
                var split = savedString.Split(" X ");
                index = resolutions.FindIndex(r => r.width == int.Parse(split[0]) && r.height == int.Parse(split[1]));

                return true;
            }
            else
                return false;
        }

        private bool CanChangeResolution(Resolution newResolution)
        {
            return !(Screen.width == newResolution.width && Screen.height == newResolution.height);
        }

        private List<Resolution> GetSortedScreenResolutionsList()
        {
            var resolutions = Screen.resolutions.ToList();
            Dictionary<(int width, int height), Resolution> dictionary = new Dictionary<(int, int), Resolution>();

            foreach (var resolution in resolutions)
                dictionary.TryAdd((resolution.width, resolution.height), resolution);

            return dictionary.Values.ToList();
        }

        private string GetFormatedResolutionString(int width, int height) =>  $"{width}{Resolution_Separator}{height}";


        private string GetPrefsKey()
        {
            var index = PlayerPrefs.GetInt(SettingGraphicDisplay.Display_Key, 0);
            return string.Format(Resolution_Key, SettingsHelper.GetDisplayInfo(index).name);
        }
    }
}
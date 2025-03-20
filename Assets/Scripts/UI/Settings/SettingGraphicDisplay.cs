using UnityEngine;
using System.Linq;

namespace Assets.Scripts.Settings
{
    public class SettingGraphicDisplay
    {
        public const string Display_Key = "Display";

        public void Init(TMPro.TMP_Dropdown displayDropdown)
        {
            var lastSelectedDisplay = GetSavedDisplay();
            var activeDisplay = ActiveDisplay();

            displayDropdown.AddOptions(SettingsHelper.GetDisplayInfos().Select(x => x.name).ToList());

            if (lastSelectedDisplay < Display.displays.Length)
            {
                if (activeDisplay != lastSelectedDisplay)
                    SetDisplay(lastSelectedDisplay);
            }
            else
                PlayerPrefs.SetInt(Display_Key, activeDisplay);
        }

        public void SetDisplay(int index)
        {
            PlayerPrefs.SetInt(Display_Key, index);
            Display.displays[index].Activate();
        }

        private int GetSavedDisplay()
        {
            return PlayerPrefs.GetInt(Display_Key, 0);
        }

        private int ActiveDisplay()
        {
            var index = 0;
            for (var i = 0; i < Display.displays.Length; i++)
            {
                if (!Display.displays[i].active) continue;
                index = i;
                break;
            }

            return index;
        }
    }
}
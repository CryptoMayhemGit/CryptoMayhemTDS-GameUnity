using UnityEngine;
using TMPro;
using Assets.Scripts.Settings;

namespace Assets.Scripts.UI
{
    public class UIGraphics : MonoBehaviour
    {
        private SettingGraphicResolution settingResolution = new();
        private SettingGraphicDisplay settingcDisplay = new();

        public void Init(TMP_Dropdown resolutionDropdown, TMP_Dropdown displaynDropdown)
        {
            settingcDisplay.Init(displaynDropdown);
            settingResolution.Init(resolutionDropdown);
        }

        public void SetDisplay(int index)
        {
            settingcDisplay.SetDisplay(index);
            settingResolution.Refresh();
        }

        public void SetResolution(int index) => settingResolution.SetResolution(index);
    }
}
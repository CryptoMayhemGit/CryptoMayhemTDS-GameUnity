using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Settings
{
    public static class SettingsHelper
    {
        public static List<DisplayInfo> GetDisplayInfos()
        {
            List<DisplayInfo> displayLayout = new List<DisplayInfo>();
            Screen.GetDisplayLayout(displayLayout);

            return displayLayout;
        }

        public static DisplayInfo GetDisplayInfo(int displayIndex)
        {
            List<DisplayInfo> displayLayout = new List<DisplayInfo>();
            Screen.GetDisplayLayout(displayLayout);

            return displayLayout[displayIndex];
        }      
    }
}
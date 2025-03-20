using UnityEngine.Localization.Settings;

namespace Assets.Scripts.UI
{
    public class UILanguage : UnityEngine.MonoBehaviour
    {
        public void SelectLanguage(int languageID)
        {
            UnityEngine.Localization.Locale newLocale = LocalizationSettings.AvailableLocales.Locales[languageID];
            if (LocalizationSettings.SelectedLocale != newLocale)
                LocalizationSettings.SelectedLocale = newLocale;
        }
    }
}
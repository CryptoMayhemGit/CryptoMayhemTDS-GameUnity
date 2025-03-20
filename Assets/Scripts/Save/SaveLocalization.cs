using UnityEngine;
using UnityEngine.Localization.Settings;

namespace Assets.Scripts.Save
{
    public class SaveLocalization : IStartupLocaleSelector, IInitialize
    {
        private readonly string KEY = "selected-locale";

        public void PostInitialization(LocalizationSettings settings)
        {
            PlayerPrefs.SetString(KEY, settings.GetSelectedLocale().Identifier.Code);
        }

        UnityEngine.Localization.Locale IStartupLocaleSelector.GetStartupLocale(ILocalesProvider availableLocales)
        {
            var language = PlayerPrefs.GetString(KEY, "");

            if (!string.IsNullOrEmpty(language))
                return availableLocales.GetLocale(language);
            else
                return null;
        }
    }
}
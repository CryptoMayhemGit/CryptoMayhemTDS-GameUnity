using UnityEngine;

namespace Assets.Scripts.Manager
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Manager/Biomass Save")]
    public class BiomassSaveManager : Manager
    {
        private const string MOTHERSHIP_BIOMASS_NAME = "MothershipBiomass";

        [SerializeField] private FloatVariable mothershipBiomass = null;

        public override void Enable() => Load();

        public override void Disable() => Save();

        public void Save() => PlayerPrefs.SetFloat(MOTHERSHIP_BIOMASS_NAME, mothershipBiomass.Value);

        public void Load() => mothershipBiomass.Value = PlayerPrefs.GetFloat(MOTHERSHIP_BIOMASS_NAME, 0f);
    }
}
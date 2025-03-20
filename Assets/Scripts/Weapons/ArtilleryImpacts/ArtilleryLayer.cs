using UnityEngine;

namespace Assets.Scripts.Weapons.ArtilleryImpacts
{
    [System.Serializable]
    public class ArtilleryLayer
    {
        [field: SerializeField] public float Radius { get; private set; } = 3;
        [field: SerializeReference] public HitActions.HitAction Action { get; private set; } = null;
    }
}
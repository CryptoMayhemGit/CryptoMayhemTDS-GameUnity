using Assets.Scripts.Weapons.DestroyActions;
using Assets.Scripts.Weapons.HitActions;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Weapons.ArtilleryImpacts
{
    [System.Serializable]
    public class ArtilleryImpactCore
    {
        [field: SerializeField, Min(0.1f)] public float Radius { private set; get; } = 10f;
        [field: SerializeField, Min(0.1f)] public float Delay { private set; get; } = 1;
        [field: SerializeField] public LayerMask TargetLayer { private set; get; } = default;
        [SerializeReference, Space] private List<HitAction> hitActions = new();
        [SerializeReference] private List<DestroyAction> destroyActions = new();
        [SerializeReference, Space] private List<ArtilleryLayer> layers = new();

        public IReadOnlyList<HitAction> HitActions => hitActions;
        public IReadOnlyList<DestroyAction> DestroyActions => destroyActions;
        public List<ArtilleryLayer> Layers => layers;
    }
}
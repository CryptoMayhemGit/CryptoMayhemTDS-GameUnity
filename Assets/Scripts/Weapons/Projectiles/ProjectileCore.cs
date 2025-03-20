using Assets.Scripts.Weapons.DestroyActions;
using Assets.Scripts.Weapons.HitActions;
using Assets.Scripts.Weapons.Projectiles.MoveTypes;
using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Weapons.Projectiles
{
    [System.Serializable]
    public class ProjectileCore
    {
        [field: SerializeReference] public ProjectileMoveType MoveType { private set; get; } = new CurveProjectileMoveType();
        [field: SerializeField, Min(0.1f)] public float ProjectileLifeTime { private set; get; } = 1;
        [field: SerializeField, Min(0.1f)] public float Speed { private set; get; } = 1;
        [field: SerializeField] public bool DestroyOnHit { private set; get; } = true;
        [field: SerializeField] public Pooling.VisualEffectsPool EffectsPool { private set; get; } = null;
        [SerializeReference, Space] private List<HitAction> hitActions = new();
        [SerializeReference, Space] private List<DestroyAction> destroyActions = new();

        public IReadOnlyList<HitAction> HitActions => hitActions;
        public IReadOnlyList<DestroyAction> DestroyActions => destroyActions;
    }
}
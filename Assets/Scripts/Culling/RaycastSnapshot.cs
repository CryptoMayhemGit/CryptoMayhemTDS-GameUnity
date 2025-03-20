using UnityEngine;

namespace Culling
{
    public readonly struct RaycastHitSnapshot
    {
        public readonly Vector2 Point;
        public  readonly float Distance;
        
        public RaycastHitSnapshot(in Vector2 point, in float distance)
        {
            Point = point;
            Distance = distance;
        }
    }
    public readonly struct RaycastSnapshot : IQuadTreeObject
    {
        public readonly Vector2 Origin;
        public readonly Vector2 Direction;
        public readonly float Distance;
        public readonly RaycastHitSnapshot[] Hits;

        public RaycastSnapshot(in Vector2 origin, in Vector2 direction, in RaycastHitSnapshot[] hits, in float distance)
        {
            Origin = origin;
            Direction = direction;
            Hits = hits;
            Distance = distance;
        }

        public Vector2 GetPosition() { return Origin; }

        /// <inheritdoc />
        public void OnRemoved()
        { }
    }
}
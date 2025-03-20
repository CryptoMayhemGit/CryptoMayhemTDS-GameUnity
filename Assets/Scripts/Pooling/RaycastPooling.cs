using System;
using System.Collections.Generic;
using Culling;
using UnityEngine;
using UnityEngine.Profiling;

namespace Pooling
{
    public static class RaycastPooling
    {
        private const float FrustumError = 0.2f;
        private const float FrustumErrorHalf = FrustumError / 2f;
        private const float DirectionError = 0.025f;
        
        public static void Setup(Vector2 pos, float width, float height)
        {
            _tree = QuadTree2<RaycastSnapshot>.Create(null, new Rect(pos.x, pos.y, width, height));
        }

        public static void Dispose()
        {
            QuadTree2<RaycastSnapshot>.Return(_tree);
            _tree = default;
        }

        public static void DebugDraw()
        {
            _tree?.DrawDebug();
        }
        
        public static int RaycastNonAlloc(Vector2 point, Vector2 direction, List<RaycastHitSnapshot> hits, RaycastHit2D[] cache, float distance)
        {
            if (EnableCashing && Application.isPlaying)
            {
                Profiler.BeginSample("Retrieve from Cache");
                var frustum = new Rect(
                    point.x - FrustumErrorHalf,
                    point.y - FrustumErrorHalf,
                    FrustumError,
                    FrustumError
                );

                SnapshotsCache.Clear();
                _tree.RetrieveObjectsInAreaNoAlloc(frustum, SnapshotsCache);

                // Find snapshot that direction is close enough to provided direction
                for (int index0 = 0; index0 < SnapshotsCache.Count; index0++)
                {
                    var snap = SnapshotsCache[index0];
                    if (Math.Abs(snap.Direction.x - direction.x) < DirectionError &&
                        Math.Abs(snap.Direction.y - direction.y) < DirectionError &&
                        Math.Abs(snap.Distance - distance) < DirectionError)
                    {
                        var list = snap.Hits;
                        hits.AddRange(list);
                        Profiler.EndSample();
                        return list.Length;
                    }
                }
                Profiler.EndSample();
            }
            
            Profiler.BeginSample("Raycast Physics");
            var groundMask = LayerMask.NameToLayer("Obstacle");
            var count = Physics2D.RaycastNonAlloc(point, direction, cache, distance, groundMask);
            var array = new RaycastHitSnapshot[count];
            for (var index0 = 0; index0 < count; index0++)
            {
                var hit = cache[index0];
                array[index0] = new RaycastHitSnapshot(hit.point, hit.distance);
            }

            if (EnableCashing && Application.isPlaying)
            {
                var snapshot = new RaycastSnapshot(in point, in direction, in array, in distance);
                _tree.Insert(snapshot);
            }

            hits.AddRange(array);
            Profiler.EndSample();
            return array.Length;
        }
        
        public static bool EnableCashing { get; set; } = true;
        
        private static QuadTree2<RaycastSnapshot> _tree;
        private static readonly List<RaycastSnapshot> SnapshotsCache = new(128);
    }
}
using System.Collections.Generic;
using Assets.Scripts.Pooling;
using Assets.Scripts.SOArchitecture;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Profiling;

namespace Radar
{
    public class PlayerRadar : MonoBehaviour
    {
        [FoldoutGroup("Links"), SerializeField]
        private TransformPool radarPingPool;

        [FoldoutGroup("Links"), SerializeField]
        private UIRadarVariable uiRadarVariable;

        [FoldoutGroup("Links"), SerializeField]
        private GameManagerVariable gameManagerVariable;

        [FoldoutGroup("Links"), SerializeField]
        private Transform radarPingPrefab;

        [FoldoutGroup("Links"), SerializeField]
        private Transform sweepTransform;

        [FoldoutGroup("Settings"), SerializeField]
        private LayerMask radarLayerMask;

        [FoldoutGroup("Settings"), SerializeField]
        private float rotationSpeed = 180f;

        [FoldoutGroup("Settings"), SerializeField]
        private float radarDistance = 75;


        private readonly List<Collider> cachedColliders = new();


        private readonly RaycastHit[] results = new RaycastHit[128];
        private Transform _transform;

        public void Init(bool state)
        {
            if (!state)
            {
                DeInit();
                return;
            }
            uiRadarVariable.Value.GetCanvasRoot.gameObject.SetActive(true);
            _transform = transform;
            gameManagerVariable.Value.OnUpdate += OnUpdate;
        }

        public void DeInit()
        {
            gameManagerVariable.Value.OnUpdate -= OnUpdate;
        }

        private void OnUpdate()
        {
            if (sweepTransform == null) return;
            Profiler.BeginSample("PlayerRadar.OnUpdate");
           
            var eulerAngles = sweepTransform.eulerAngles;
            eulerAngles -= new Vector3(0, 0, rotationSpeed * Time.deltaTime);
            sweepTransform.eulerAngles = eulerAngles;

            //update ui position
            uiRadarVariable.Value.GetRadarRotator.eulerAngles = new Vector3(0, 0, eulerAngles.y);

            //Clear cached colliders after full circle scan pass
            if (sweepTransform.eulerAngles.y >= 355f)
                cachedColliders.Clear();


            var size = Physics.RaycastNonAlloc(_transform.position, sweepTransform.right, results, radarDistance,
                radarLayerMask);

            for (var i = 0; i < size; i++)
            {
                if (results[i].collider == null) continue;
                if (cachedColliders.Contains(results[i].collider)) continue;

                cachedColliders.Add(results[i].collider);

                var radarPing = radarPingPool.GetFromPool().GetComponent<RadarPing>();
                Transform radarPingTransform;
                (radarPingTransform = radarPing.transform).SetParent(uiRadarVariable.Value.GetRadarPingRoot);

                var distanceToPlayer = results[i].point -_transform.position ;
                radarPingTransform.localPosition = new Vector3(-distanceToPlayer.x, distanceToPlayer.z, 0f);

                radarPing.SetColor(new Color(1, 0, 0));
                radarPing.SetDisappearTimer(360f / rotationSpeed * 1f);
            }

            Profiler.EndSample();
        }

        // private void OnDrawGizmosSelected()
        // {
        //     Gizmos.color = Color.black;
        //     var position = _transform.position;
        //     Gizmos.DrawLine(position, position + sweepTransform.right * radarDistance);
        // }
    }
}
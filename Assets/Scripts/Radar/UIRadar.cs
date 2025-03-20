using UnityEngine;

namespace Radar
{
    public class UIRadar : MonoBehaviour
    {
        [SerializeField] private Transform radarPingRoot;
        [SerializeField] private Transform radarRotator;
        [SerializeField] private Transform canvasRoot;
        public Transform GetRadarPingRoot => radarPingRoot;
        public Transform GetRadarRotator => radarRotator;
        public Transform GetCanvasRoot => canvasRoot;
        public void Init()
        {
            
        }
    }
}

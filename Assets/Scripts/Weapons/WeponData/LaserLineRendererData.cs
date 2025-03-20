using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Weapons.WeponData
{
    public class LaserLineRendererData : MonoBehaviour
    {
        [SerializeField] private List<LineRenderer> lineRenderers;

        public List<LineRenderer> GetLineRenderers()
        {
            return lineRenderers;
        }
    }
}
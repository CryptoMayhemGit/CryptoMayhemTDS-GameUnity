using Extensions;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Culling
{
    [HideMonoScript, DisallowMultipleComponent]
    public sealed class ScriptCulling : MonoBehaviour
    {
        public MonoBehaviour[] scripts;
        
        private CullingObject Object { get; set; }

        private bool[] formerStates;
        
        private void Awake()
        {
            if (Application.isPlaying)
                Object = gameObject.GetComponentInAnyParent<CullingObject>(true);

            if (Object == null)
                return;
            
            formerStates = new bool[scripts.Length];
            for (var i = 0; i < scripts.Length; i++)
            {
                formerStates[i] = scripts[i].enabled;
            }
            
            Object.OnFrustumState += Refresh;
        }

        private void OnDestroy()
        {
            if (Object != null)
                Object.OnFrustumState -= Refresh;
        }

        private void OnEnable()
        {
            Refresh();
        }

        private void Refresh()
        {
            if (scripts == null)
                return;

            for (var index0 = 0; index0 < scripts.Length; index0++)
            {
                if (scripts[index0] == null)
                    continue;
                scripts[index0].enabled = Object.InFrustum && formerStates[index0];
            }
        }
    }
}
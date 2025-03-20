using Culling;
using Sirenix.OdinInspector;
using UnityEngine;

[HideMonoScript, DisallowMultipleComponent]
public sealed class CullingInGameDebug : MonoBehaviour
{
    public bool drawDebug = false;

    private void OnGUI()
    {
        if (!drawDebug)
            return;

        var main = Camera.main;
        if (main == null)
        {
            return;
        }

        for (var index0 = 0; index0 < CullingProcessor.CullingGroups.Count; index0++)
        {
            var c = CullingProcessor.CullingGroups[index0];
            for (var index1 = 0; index1 < c.ObjectsToCull.Count; index1++)
            {
                var obj = c.ObjectsToCull[index1];
                if (obj == null)
                {
                    continue;
                }

                // Translate to screen space
                var screenPosition = main.WorldToScreenPoint(obj.transform.position);
                screenPosition.y = Screen.height - screenPosition.y;
                GUI.Box(new Rect(screenPosition.x, screenPosition.y, 200, 30), $"In frustum: {obj.InFrustum}");
            }
        }
    }
}
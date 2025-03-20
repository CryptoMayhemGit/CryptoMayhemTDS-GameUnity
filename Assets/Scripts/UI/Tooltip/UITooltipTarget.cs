using UnityEngine;
using UnityEngine.EventSystems;

namespace Assets.Scripts.UI.Tooltip
{
    public class UITooltipTarget : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
    {
        [SerializeField] private UnityObjectInterfaceReference<ITooltipable> tooltipable = null;
        [SerializeField] private SOArchitecture.Event.UITooltipTargetGameEvent showTooltip = null;
        [SerializeField] private GameEvent hideTooltip = null;

        public Inventory.Item Item => tooltipable.Value.Item;

        public void OnPointerEnter(PointerEventData eventData) => showTooltip.Raise(this);
        public void OnPointerExit(PointerEventData eventData) => hideTooltip.Raise();
    }
}
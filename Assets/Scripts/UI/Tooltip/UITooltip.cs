using TMPro;
using UnityEngine;

namespace Assets.Scripts.UI.Tooltip
{
    public class UITooltip : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI itemName = null;
        [SerializeField] private TextMeshProUGUI description = null;

        public void Show(UITooltipTarget target)
        {
            itemName.text = target.Item.localizedStringLong.GetLocalizedString();
            description.text = target.Item.localizedStringDescription.GetLocalizedString();
        }
    }
}
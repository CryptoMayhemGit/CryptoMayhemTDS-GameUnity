using Sirenix.OdinInspector;
using TMPro;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public abstract class UIBuy : MonoBehaviour
    {
        protected const string COSTBASENAME = "BIOMASS";

        [SerializeField] private FloatVariable biomass = null;

        protected UIInventory uiInventory;

        [SerializeField, FoldoutGroup("Visual")]
        protected Image possibleBuyBackground;

        [SerializeField, FoldoutGroup("Visual")]
        protected Image imPossibleBuyBackground;

        [SerializeField, FoldoutGroup("Visual")]
        protected Image buyLocker;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI buyText;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI itemName;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI itemCost;

        [SerializeField, FoldoutGroup("Visual")]
        protected TextMeshProUGUI requiredZealyLevel;

        [SerializeField, FoldoutGroup("Visual")]
        protected Image itemImage;

        protected Button button;
        protected UIButtonHandler uiButtonHandler;
        private void Awake()
        {
            Assert.IsNotNull(possibleBuyBackground, "possibleBuyBackground != null");
            Assert.IsNotNull(imPossibleBuyBackground, "imPossibleBuyBackground != null");
            Assert.IsNotNull(buyLocker, "buyLocker != null");
            Assert.IsNotNull(buyText, "buyText != null");
            Assert.IsNotNull(itemName, "itemName != null");
            Assert.IsNotNull(itemCost, "itemCost != null");
            Assert.IsNotNull(itemImage, "itemImage != null");
        }

        private void OnEnable()
        {
            CanBuyInternal();
        }

        public void Buy()
        {
            TryBuy();
        }

        public void Init(UIInventory uiInventory)
        {
            button = GetComponent<Button>();
            Assert.IsNotNull(button, "button != null");

            uiButtonHandler = GetComponent<UIButtonHandler>();
            Assert.IsNotNull(uiButtonHandler, "uiButtonHandler != null");
            
            this.uiInventory = uiInventory;
            InitInternal();
        }

        protected abstract void InitInternal();

        public void CanBuy()
        {
            CanBuyInternal();
        }

        protected abstract void TryBuy();

        protected abstract void CanBuyInternal();
    }
}
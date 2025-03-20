using System.Collections.Generic;
using Assets.Scripts.Questlog;
using Assets.Scripts.SOArchitecture;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UI
{
    public class UIQuestInfoSetter : MonoBehaviour
    {
        [SerializeField] private GameEvent onHideQuestInfo = null;
        [SerializeField] private GameEvent onRefreshQuestInfo = null;
        [SerializeField] private QuestDataVariable mainQuest = null;
        [SerializeField, Space] private Sprite normalSprite;
        [SerializeField] private Sprite selectedSprite;
        [SerializeField, Space] private GameObject descriptionGroup = null;
        [SerializeField] private GameObject imageGroup = null;
        [SerializeField] private Button hangarButton = null;
        [SerializeField, Space] private TextMeshProUGUI textName = null;
        [SerializeField] private TextMeshProUGUI textTitle = null;
        [SerializeField] private TextMeshProUGUI textDescription = null;
        [SerializeField] private List<OrderHolder> orderHolders = null;
        [SerializeField] private TextMeshProUGUI textAttention = null;
        [SerializeField] private TextMeshProUGUI textSignature = null;
        [SerializeField, Space] private Image biomeImage = null;
        [SerializeField] private Image mapImage = null;

        [SerializeField] private List<Button> questButttons = null;

        private void OnEnable()
        {
            onHideQuestInfo.AddListener(SetDisableQuestInfo);
            onRefreshQuestInfo.AddListener(Refresh);
        }
            

        private void OnDisable()
        {
            onHideQuestInfo.RemoveListener(SetDisableQuestInfo);
            onRefreshQuestInfo.RemoveListener(Refresh);
        }


        private void SetDisableQuestInfo()
        {
            SetQuestInfoDeactive();
            DeactiveAllButtons();
        }

        private void Refresh()
        {
            if (IsDescriptionActive())
            {
                SetQuestInfoDeactive();
            }
            else
            {
                SetQuestInfoActive();
            }

        }

        private void SetQuestInfoDeactive()
        {
            descriptionGroup.SetActive(false);
            imageGroup.SetActive(false);
            hangarButton.interactable = false;
        }

        private void SetQuestInfoActive()
        {
            QuestInfo info = mainQuest.Value.QuestInfo;

            textName.text = info.NameLocale.GetLocalizedString();
            textTitle.text = info.TitleLocale.GetLocalizedString();
            textDescription.text = info.DescriptionLocale.GetLocalizedString();
            textAttention.text = info.AttentionLocale.GetLocalizedString();
            textSignature.text = info.SignatureLocale.GetLocalizedString();

            textAttention.gameObject.SetActive(info.SignatureLocale != null &&
                                               !string.IsNullOrEmpty(info.SignatureLocale.GetLocalizedString()));

            SetupOrders(info.Orders);

            biomeImage.sprite = info.BiomeSprite;
            mapImage.sprite = info.MapSprite;

            descriptionGroup.SetActive(true);
            imageGroup.SetActive(true);
            hangarButton.interactable = true;
        }

        private void SetupOrders(List<Order> orders)
        {
            foreach (var item in orderHolders)
                item.gameObject.SetActive(false);

            for (var i = 0; i < orders.Count; i++)
                orderHolders[i].Enable(i + 1, orders[i]);
        }

        public void SetSelectedButton(Button button)
        {
            if(IsDescriptionActive() == false && IsCurrentButtonActive(button) == false)
            {
                SetQuestInfoActive();
            }


            DeactiveAllButtons();

            if (IsDescriptionActive())
            {
                button.image.sprite = selectedSprite;
            }
        }

        private void DeactiveAllButtons()
        {
            foreach (Button button in questButttons)
            {
                button.image.sprite = normalSprite;
            }
        }

        private bool IsDescriptionActive()
        {
            return descriptionGroup.activeInHierarchy || imageGroup.activeInHierarchy;
        }

        private bool IsCurrentButtonActive(Button button)
        {
            return button.image.sprite == selectedSprite;
        }
    }
}
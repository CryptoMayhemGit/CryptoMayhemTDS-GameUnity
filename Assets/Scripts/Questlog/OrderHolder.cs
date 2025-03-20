using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace Assets.Scripts.Questlog
{
    public class OrderHolder : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI textNumber = null;
        [SerializeField] private TextMeshProUGUI textTitle = null;
        [SerializeField] private List<TextMeshProUGUI> textDescriptions = null;

        public void Enable(int number, Order order)
        {
            textNumber.text = number.ToString();
            textTitle.text = order.OrderTitleLocale.GetLocalizedString();
            
            foreach (var item in textDescriptions)
                item.gameObject.SetActive(false);

            for (var i = 0; i < order.Descriptions.Count; i++)
            {
                textDescriptions[i].text = order.OrderDescriptionsLocale[i].GetLocalizedString();
                textDescriptions[i].gameObject.SetActive(true);
            }

            gameObject.SetActive(true);
        }
    }
}
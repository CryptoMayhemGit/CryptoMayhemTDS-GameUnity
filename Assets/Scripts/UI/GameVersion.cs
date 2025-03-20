using TMPro;
using UnityEngine;

public class GameVersion : MonoBehaviour
{
    [SerializeField] private TextMeshProUGUI text;

    public void OnAwake()
    {
        text.text = Application.version;
    }
}

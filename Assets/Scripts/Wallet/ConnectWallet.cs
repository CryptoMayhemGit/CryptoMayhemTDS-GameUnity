using UnityEngine;

namespace Assets.Scripts.Wallet
{
    public class ConnectWallet : MonoBehaviour
    {
        public async void OnLogin()
        {
            int timestamp = (int)(System.DateTime.UtcNow.Subtract(new System.DateTime(1970, 1, 1))).TotalSeconds;
            string message = (timestamp + 60).ToString();

            string account = await EVM.Verify(message, await Web3Wallet.Sign(message));
            int now = (int)(System.DateTime.UtcNow.Subtract(new System.DateTime(1970, 1, 1))).TotalSeconds;

            if (account.Length == 42 && (timestamp + 60) >= now)
            {
                Debug.Log("Account: " + account);
            }
            else
            {
                Debug.LogError("sign error");
            }
        }
    }
}
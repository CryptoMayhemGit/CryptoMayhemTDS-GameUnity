namespace Assets.Scripts.UI.Authorization.Models
{
    internal class SignedData
    {
        public string Wallet { get; set; }
        public string Nonce { get; set; }
        public string Message { get; set; }
        public string Handle { get; set; }
    }
}

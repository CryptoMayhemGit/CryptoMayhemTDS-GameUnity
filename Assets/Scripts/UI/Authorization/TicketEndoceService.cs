using Assets.Scripts.UI.Authorization.Models;
using System;

namespace Assets.Scripts.UI.Authorization
{
    public class TicketEndoceService
    {
        public string DecodeTicket(string ticket)
        {
            string result;

            try
            {
                string decodedJsonTicket = Base64Decode(ticket);
                SignedFreshData signedFreshData = Newtonsoft.Json.JsonConvert.DeserializeObject<SignedFreshData>(decodedJsonTicket);
                SignedData signedData = Newtonsoft.Json.JsonConvert.DeserializeObject<SignedData>(signedFreshData.Data);

                return signedData.Wallet;
            }
            catch
            {
                return null;
            }
        }

        internal bool DecodeInvestorStatus(string investorStatus)
        {
            bool result;

            try
            {
                GetInvestorStatusResponse investorStatusResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<GetInvestorStatusResponse>(investorStatus);

                return investorStatusResponse.isInvestor;
            }
            catch (Exception ex) 
            {
                return false;
            }
        }

        private string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}

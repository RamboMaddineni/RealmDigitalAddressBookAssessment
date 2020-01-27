using Newtonsoft.Json;
using RealmDigitalAddressBookAssessment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Utilities
{
    public class ResponseUtility
    {
        public const string Success = "Request was Successful";

        public const string UnSuccessful = "Request was unsuccessful";

        internal static ResponseModel CreateResponse<T>(T response, bool isSuccessful = true)
        {
            return new ResponseModel
            {
                Success = isSuccessful,
                Message = isSuccessful ? Success : UnSuccessful,
                Result = !EqualityComparer<T>.Default.Equals(response, default(T)) ? JsonConvert.SerializeObject(response) : null
            };
        }
    }
}

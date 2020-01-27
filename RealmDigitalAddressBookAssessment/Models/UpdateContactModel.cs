using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Models
{
    public class UpdateContactModel
    {
        public int ContactId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}

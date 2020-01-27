using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Repository.Models
{
    public class DbConnection
    {
        public string ConnectionString { get; set; }
        public string StoredProcedure { get; set; }
        public object Parameters { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Repository.Models
{
    public class DbRequest<T> where T : new()
    {
        public DbConnection DbConnection { get; set; } = new DbConnection();
        public T item { get; set; }
    }
}

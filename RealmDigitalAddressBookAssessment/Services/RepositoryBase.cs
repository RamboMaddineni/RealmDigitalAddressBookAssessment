using Microsoft.Extensions.Configuration;
using RealmDigitalAddressBookAssessment.Repository.Contracts;
using RealmDigitalAddressBookAssessment.Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Services
{
    public class RepositoryBase
    {
        internal IDapperRepository _dapperRepository;
        internal DbConnection _dbconnection { get; set; } = new DbConnection();
        private IConfiguration _configuration;
        public RepositoryBase(IDapperRepository dapperRepository, IConfiguration configuration)
        {
            _dapperRepository = dapperRepository;
            _configuration = configuration;
            _dbconnection.ConnectionString = configuration.GetSection("AddressBookConnectionString").Value;
        }
    }
}

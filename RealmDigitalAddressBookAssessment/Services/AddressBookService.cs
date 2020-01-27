using Microsoft.Extensions.Configuration;
using RealmDigitalAddressBookAssessment.Contracts;
using RealmDigitalAddressBookAssessment.Models;
using RealmDigitalAddressBookAssessment.Repository.Contracts;
using RealmDigitalAddressBookAssessment.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Services
{
    public class AddressBookService : RepositoryBase, IAddressBookService
    {
        public AddressBookService(IDapperRepository dapperRepository, IConfiguration configuration):base(dapperRepository, configuration)
        {

        }

        public async Task<int> AddNewContact(AddNewContactModel Addmodel)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.AddContactStoredProcedure;
                _dbconnection.Parameters = Addmodel;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<int> AddNewContactNumber(AddContactNumberModel model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.AddContactNumberStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<int> AddNewEmailAddress(AddNewEmailModel model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.AddEmailAddressStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }



        public async Task<int> DeleteContact(DeleteContactModel deletemodel)
        {

            try
            {
                _dbconnection.StoredProcedure = Constants.DeleteContactStoredProcedure;
                _dbconnection.Parameters = deletemodel;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<int> DeleteContactNumber(DeleteContactNumberModel model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.DeleteContactNumberStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
        }

        public async Task<int> DeleteEmailAddress(DeleteEmailAddressModel model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.DeleteEmailAddressStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public async Task<IList<GetContactsModel>> GetContacts()
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.GetContactsStoredProcedure;
                _dbconnection.Parameters = null;
                return await _dapperRepository.QueryList<GetContactsModel>(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IList<GetEmailAddressModel>> GetEmails(GetContactDetailsById model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.GetEmailAddressByContactIdStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.QueryList<GetEmailAddressModel>(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IList<GetContactNumbersModel>> GetContactNumbers(GetContactDetailsById model)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.GetContactNumbersByContactIdStoredProcedure;
                _dbconnection.Parameters = model;
                return await _dapperRepository.QueryList<GetContactNumbersModel>(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public async Task<int> UpdateContact(UpdateContactModel updatemodel)
        {
            try
            {
                _dbconnection.StoredProcedure = Constants.UpdateContactStoredProcedure;
                _dbconnection.Parameters = updatemodel;
                return await _dapperRepository.Execute(_dbconnection);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}

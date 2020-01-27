using RealmDigitalAddressBookAssessment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RealmDigitalAddressBookAssessment.Contracts
{
    public interface IAddressBookService
    {
        Task<IList<GetContactsModel>> GetContacts();
        Task<IList<GetContactNumbersModel>> GetContactNumbers(GetContactDetailsById model);
        Task<IList<GetEmailAddressModel>> GetEmails(GetContactDetailsById model);

        Task<int> AddNewContact(AddNewContactModel Addmodel);
        Task<int> AddNewContactNumber(AddContactNumberModel model);
        Task<int> AddNewEmailAddress(AddNewEmailModel model);

        Task<int> UpdateContact(UpdateContactModel updatemodel);

        Task<int> DeleteContact(DeleteContactModel deletemodel);
        Task<int> DeleteContactNumber(DeleteContactNumberModel model);
        Task<int> DeleteEmailAddress(DeleteEmailAddressModel model);

    }
}

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using RealmDigitalAddressBookAssessment.Contracts;
using RealmDigitalAddressBookAssessment.Models;

namespace RealmDigitalAddressBookAssessment.Controllers
{
    public class HomeController : Controller
    {
        private readonly IAddressBookService _addressbookservice;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, IAddressBookService addressbookservice)
        {
            _logger = logger;
            _addressbookservice = addressbookservice;
        }

        public IActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public async Task<ActionResult> GetAllContacts()
        {
            IList<GetContactsModel> result = await _addressbookservice.GetContacts();
            return Json(new { success = true, response = result });
        }


        [HttpPost]
        public async Task<ActionResult> GetContactNumbers([FromBody]GetContactDetailsById modal)
        {
            IList<GetContactNumbersModel> result = await _addressbookservice.GetContactNumbers(modal);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> GetEmailAddresses([FromBody]GetContactDetailsById modal)
        {
  
            IList<GetEmailAddressModel> result = await _addressbookservice.GetEmails(modal);
            return Json(new { success = true, response = result });
        }


        [HttpPost]
        public async Task<ActionResult> AddNewContact([FromBody]AddNewContactModel model)
        {
            var result = await _addressbookservice.AddNewContact(model);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> AddContactNumber([FromBody]AddContactNumberModel model)
        {
            var result = await _addressbookservice.AddNewContactNumber(model);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> AddEmailAddress([FromBody]AddNewEmailModel model)
        {
            var result = await _addressbookservice.AddNewEmailAddress(model);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> UpdateContact([FromBody]UpdateContactModel model)
        {
            var result = await _addressbookservice.UpdateContact(model);
            return Json(new { success = true, response = result });
        }


        [HttpPost]
        public async Task<ActionResult> DeleteContact([FromBody]DeleteContactModel model)
        {
            var result = await _addressbookservice.DeleteContact(model);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> DeleteContactNumber([FromBody]DeleteContactNumberModel model)
        {
            var result = await _addressbookservice.DeleteContactNumber(model);
            return Json(new { success = true, response = result });
        }

        [HttpPost]
        public async Task<ActionResult> DeleteEmailAddress([FromBody]DeleteEmailAddressModel model)
        {
            var result = await _addressbookservice.DeleteEmailAddress(model);
            return Json(new { success = true, response = result });
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


    }
}

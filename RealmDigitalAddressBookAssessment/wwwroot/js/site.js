

$(document).ready(function () {
    //$('.modal').modal();

    $('.modal').modal({
        onCloseEnd: function () {
            window.location.reload(true);
        }
    });

    $('.tabs').tabs();
    getContacts();
});



function getContacts() {
    var url = "/Home/GetAllContacts";
    $.ajax({
        contentType: 'application/json',
        type: "GET",
        url: url,
        success: function (data) {
            buildContactsHTML(data.response);
        },
        error: function (jqXHR) {

        }
    });

}


function buildContactsHTML(elements) {
    $("#contacts-body").html("");
    var contactsBody = "";
    for (var i = 0; i < elements.length; i++) {

        var idnetity = i + 1;
        contactsBody += "<tr>\
                        <td>" + idnetity + "</td>\
                        <td class='contact-name'>" + elements[i].firstName + "</td>\
                        <td class='contact-name'>" + elements[i].lastName + "</td>\
                        <td class='data-actions'><a data-target='products-modal' onClick=\"triggerViewContactNumbers('"+ elements[i].contactId + "');\"> <i class='material-icons'>contact_phone</i></a>\
                        <a onClick=\"triggerViewEmails('"+ elements[i].contactId + "');\"> <i class='material-icons'>contact_mail</i></a>\
                        <a class='modal-trigger' data-target='updatecontactmodal' href='#updatecontactmodal' onClick=\"triggerUpdateContact('"+ elements[i].firstName + "','" + elements[i].lastName + "','" + elements[i].contactId + "'); \"> <i class='material-icons'>edit</i></a>\
                        <a onClick=\"triggerDeleteContact('"+ elements[i].contactId + "');\"> <i class='material-icons'>close</i></a></td>\
                        </tr>";
    }
    $("#contacts-body").html(contactsBody);

    $('#datatable').dataTable({
        destroy: true
    });
}



//***************Update functions*************************************************************

function triggerUpdateContact(fname, lname, id) {
    $("#update-first-name").val(fname);
    $("#update-last-name").val(lname);
    $("#update-id").val(id);
    M.updateTextFields();
}


$("#update-contact").click(function () {
    var id = $("#update-id").val();
    var firstName = $("#update-first-name").val();
    var lastName = $("#update-last-name").val();


    var body = {
        ContactId: Number(id),
        FirstName: firstName,
        LastName: lastName
        
    };

    var url = "/Home/UpdateContact";
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            clearFields();
            $('.modal').modal('close');
            M.toast({ html: 'Contact Updated' });         
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
});


//***************Add New Contacts*************************************************************

$("#save-contact").click(function () {
    var firstName = $("#first_name").val();
    var lastName = $("#last_name").val();
    var contactNumber = $("#contact-number").val();
    var email = $("#email").val();

    if (firstName !== "" && lastName !== "" && contactNumber !== "" && email !=="") {
    var body = {
        FirstName: firstName,
        LastName: lastName,
        ContactNumber: contactNumber,
        EmailAddress: email
    };
    saveContact(body);
}
    else {
        M.toast({ html: 'Required fileds' });
    }

});


function saveContact(body) {
    var url = "/Home/AddNewContact";
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            M.toast({ html: 'Contact added' });         
            getContacts();
            $("#first_name").val("");
            $("#last_name").val("");
            $("#contact-number").val("");
            $("#email").val("");
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}


//***********************************Delete Contact***************************************************************

function triggerDeleteContact(id) {

    var body =
    {
        ContactId: Number(id)
    };
    var url = "/Home/DeleteContact";
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            M.toast({ html: 'Contact deleted' });
            getContacts();
            $("#contact-details-container").hide();
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}


function triggerDeleteContactNumber(id) {

    var body =
    {
        Id: Number(id)
    };
    var url = "/Home/DeleteContactNumber";
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            M.toast({ html: 'Contact Number deleted' });
            getContactNumbers(id);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}


function triggerDeleteEmailAddress(id) {

    var body =
    {
        EmailId: Number(id)
    };
    var url = "/Home/DeleteEmailAddress";
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            M.toast({ html: 'Email deleted' });
            getContactEmails(id);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}


//*********************View Coontact Numbers**************************************

function triggerViewContactNumbers(contactId) {
    $("#add-new-number").removeAttr('onClick');
    getContactNumbers(contactId);
    $('.tabs').tabs();
}


function getContactNumbers(contactId) {
    $("#contact-details-container").show();

    $("#add-new-number").attr('onClick', 'addNewNumber("' + contactId +'");');

    var url = "/Home/GetContactNumbers";
    var body = {
        ContactId: Number(contactId)
    };

    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            console.log(data.response);
            buildContactNumbersHTML(data.response);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}


function buildContactNumbersHTML(elements) {
    $("#contact-numbers-body").html("");
    var contactNumbersBody = "";
    for (var i = 0; i < elements.length; i++) {
        var idnetity = i + 1;
        contactNumbersBody += "<tr>\
                        <td>" + idnetity + "</td>\
                        <td class='contact-name'>" + elements[i].contactNumber + "</td>\
                        <td class='data-actions'><a onClick=\"triggerDeleteContactNumber('"+ elements[i].id + "');\"> <i class='material-icons'>close</i></a></td>\
                        </tr>";
    }

    $("#contact-numbers-body").html(contactNumbersBody);
}


function addNewNumber(contactId) {
    var contactNumber = $("#input-contact-number").val();
    var url = "/Home/AddContactNumber";
    if (contactNumber !== "") {
        var body = {
            ContactId: Number(contactId),
            ContactNumber: contactNumber
        };
    }
    
    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            $("#input-contact-number").val("");
            M.toast({ html: 'Contact number added' });
            getContactNumbers(contactId);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Required Field' });
        }
    });
}





//*********************View Emails**************************************

function triggerViewEmails(contactId) {

    $("#add-new-email").removeAttr('onClick');
    getContactEmails(contactId);
    $('.tabs').tabs();
}

function getContactEmails(contactId) {
    $("#contact-details-container").show();

    $("#add-new-email").attr('onClick', 'addNewEmail("' + contactId + '");');

    var url = "/Home/GetEmailAddresses";
    var body = {
        ContactId: Number(contactId)
    };

    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            console.log(data.response);
            buildEmailHTML(data.response);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Somthing went wrong' });
        }
    });
}

function buildEmailHTML(elements) {
    $("#contact-email-body").html("");
    var contactEmailsBody = "";
    for (var i = 0; i < elements.length; i++) {
        var idnetity = i + 1;
        contactEmailsBody += "<tr>\
                        <td>" + idnetity + "</td>\
                        <td class='contact-name'>" + elements[i].emailAddress + "</td>\
                        <td class='data-actions'><a onClick=\"triggerDeleteEmailAddress('"+ elements[i].emailId + "');\"> <i class='material-icons'>close</i></a></td>\
                        </tr>";
    }

    $("#contact-email-body").html(contactEmailsBody);
}


function addNewEmail(contactId) {
    var contactEmail = $("#input-email").val();

    var url = "/Home/AddEmailAddress";
    if (contactEmail !== "") {
        var body = {
            ContactId: Number(contactId),
            EmailAddress: contactEmail
        };
    }

    $.ajax({
        contentType: 'application/json',
        type: "POST",
        url: url,
        data: JSON.stringify(body),
        success: function (data) {
            $("#input-email").val("");
            M.toast({ html: 'Email added' });
            getContactEmails(contactId);
        },
        error: function (jqXHR) {
            M.toast({ html: 'Required Field' });
        }
    });
}


//*****************Clear Input Fields******************************************************
function clearFields() {
    $("#update-first-name").val("");
    $("#update-last-name").val("");
    $("#update-id").val("");
}




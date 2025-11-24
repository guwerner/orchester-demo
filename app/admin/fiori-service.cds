using AdminService from '../../srv/admin-service';




////////////////////////////////////////////////////////////////////////////
//
//	Musican Object Page
//
annotate AdminService.Musican with @(UI: {
    FieldGroup #General: {Data: [
        {Value: name},
        {Value: prename},
        {Value: birthdate},
        {Value: status}
    ]},
    FieldGroup #Details: {Data: [{Value: band.bandName}]},
    FieldGroup #Admin  : {Data: [
        {Value: createdAt},
        {Value: createdBy}
    ]}

});

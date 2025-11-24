using AdminService from '../../srv/admin-service';



////////////////////////////////////////////////////////////////////////////
//
//	Musican List Page
//
annotate AdminService.Musican with @(UI: {
    
    Identification  : [
        { $Type  : 'UI.DataFieldForAction', Action : 'AdminService.changeStatus',   Label  : '{i18n>ChangeStatus}'   }
    ],

    SelectionFields: [
        prename,
        name,
        instrument

    ],
    LineItem       : [
        { $Type  : 'UI.DataFieldForAction', Action : 'AdminService.changeStatus',   Label  : '{i18n>ChangeStatus}'   
        },
        {
            Value: name,
            Label: '{i18n>LastName}'
        },
        {
            Value: prename,
            Label: '{i18n>FirstName}'
        },
        {
            Value: band.bandName,
            Label: '{i18n>Band}'
        },
        {
            Value: status,
            Label: '{i18n>Status}'
        },
        {
            Value: birthdate,
            Label: '{i18n>Birthdate}'
        }
        


    ]
});


////////////////////////////////////////////////////////////////////////////
//
//	Musican Object Page
//
annotate AdminService.Musican with @(UI: {
    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Details}',
            Target: '@UI.FieldGroup#Details'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Admin}',
            Target: '@UI.FieldGroup#Admin'
        }
    ],
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

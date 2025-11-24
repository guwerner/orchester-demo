using AdminService from '../../srv/admin-service';



////////////////////////////////////////////////////////////////////////////
//
//	Musican List Page
//
annotate AdminService.Musican with @(UI: {
    
    SelectionFields: [
        prename,
        name,
        instrument

    ],
    LineItem       : [
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>CreateMusican}',
            Action: 'AdminService.CreateMusican',
            InvocationGrouping: 'ChangeSet'
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
    ]},
    FieldGroup #Details: {Data: [{Value: band.bandName}]},
    FieldGroup #Admin  : {Data: [
        {Value: createdAt},
        {Value: createdBy}
    ]}

});

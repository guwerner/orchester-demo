using AdminService from '../../srv/admin-service';


////////////////////////////////////////////////////////////////////////////
//
//	Books List Page
//
annotate AdminService.Musican with @(UI: {
    SelectionFields: [
        prename,
        name,
        instrument

    ],
    LineItem       : [
        {
            Value: name,
            Label: '{i18n>LastName}'
        },
        {
            Value: prename,
            Label: '{i18n>FirstName}'
        },
        {
            Value: band.name,
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
//	Books Object Page
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
    ],
    FieldGroup #General: {Data: [
        {Value: name},
        {Value: prename},
        {Value: birthdate},
    ]},
    FieldGroup #Details: {Data: [{Value: band_ID}]}
});

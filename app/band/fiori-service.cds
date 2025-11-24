using AdminService from '../../srv/admin-service';


////////////////////////////////////////////////////////////////////////////
//
//	Band List Page
//
annotate AdminService.Band with @(UI: {
    SelectionFields: [
        bandName,
        genre

    ],
    LineItem       : [
        {
            Value: bandName,
            Label: '{i18n>Band}'
        },
        {
            Value: genre,
            Label: '{i18n>Genre}'
        },
        {
            Value: foundedIn,
            Label: '{i18n>FoundetIn}'
        }     
    ]
});


////////////////////////////////////////////////////////////////////////////
//
//	Band Object Page
//
annotate AdminService.Band with @(UI: {
    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        
    ],
    FieldGroup #General: {Data: [
        {Value: ID}     ,
        {Value: bandName}   ,
        {Value: genre}  ,
        {Value: foundedIn} ,
    ]}

});

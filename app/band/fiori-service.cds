using AdminService from '../../srv/admin-service';





////////////////////////////////////////////////////////////////////////////
//
//	Band Object Page
//
annotate AdminService.Band with @(UI: {
    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>General}',
        Target: '@UI.FieldGroup#General'
    }

    ],
    FieldGroup #General: {Data: [
        {Value: ID},
        {Value: bandName},
        {Value: genre},
        {Value: foundedIn},
    ]},
});

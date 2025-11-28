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
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>MusicansInBand}',
        Target : 'to_musican/@UI.LineItem'
    },

    ],
    FieldGroup #General: {Data: [
        {Value: bandID},
        {Value: bandName},
        {Value: genre},
        {Value: foundedIn},
    ]},
});

annotate AdminService.BandMembers with @(UI: {
    PresentationVariant: {
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : 'musicanID',
            Descending: false
        }]
    },
    LineItem           : [
        {
            Value: to_musican.musicanID,
            Label: '{i18n>MusicanID}'
        },
        {
            Value: to_musican.prename,
            Label: '{i18n>Prename}'
        },
        {
            Value: to_musican.name,
            Label: '{i18n>Name}'
        },
        {
            Value: to_musican.instrument,
            Label: '{i18n>Instrument}'
        }
    ],
    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'Musicanist',
        Target: 'to_musican/@UI.PresentationVariant',
        Label : '{i18n>MusicanInBand}'
    }

    ],
});

using BandService from '../../srv/band-service';


////////////////////////////////////////////////////////////////////////////
//
//	Band Object Page
//
annotate BandService.Band with @(UI: {
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
        {Value: bandName},
        {Value: genre},
        {Value: foundedIn},
    ]},
});

annotate BandService.BandMembers with @(UI: {
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
            Label: '{i18n>musicanID}'
        },
        {
            Value: to_musican.prename,
            Label: '{i18n>prename}'
        },
        {
            Value: to_musican.name,
            Label: '{i18n>name}'
        },
        {
            Value: to_musican.instrument,
            Label: '{i18n>instrument}'
        },
        {
            Value: to_musican.birthdate,
            Label: '{i18n>birthdate}'
        },
        {
            Value: to_musican.musicanStatus.name,   Criticality : (to_musican.musicanStatus.code = #Inactive ? 2 : (to_musican.musicanStatus.code =#Active ? 3 :0)),
            Label: '{i18n>status}',
           
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

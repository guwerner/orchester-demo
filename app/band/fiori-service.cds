using BandService from '../../srv/band-service';


////////////////////////////////////////////////////////////////////////////
//
//	Band Object Page
//
annotate BandService.Band with @(UI: {

    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>MusicansInBand}',
            Target: 'to_musican/@UI.LineItem'
        },

    ],
    FieldGroup #General: {Data: [
        {Value: bandName},
        {Value: genre},
        {Value: foundedIn},
    ]},
});

annotate BandService.Band2Musicans with @(
    // ---------------------------------------------------------------------------
    // List Page
    // ---------------------------------------------------------------------------
    // Musican List Header

    UI : {
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
                Value       : to_musican.musicanStatus.name,
                Criticality : (to_musican.musicanStatus.code = #Inactive ? 2 : (to_musican.musicanStatus.code = #Active ? 3 : 0)),
                Label       : '{i18n>status}',

            }
        ],
        PresentationVariant: {
            Visualizations: ['@UI.LineItem'],
            SortOrder     : [{
                $Type     : 'Common.SortOrderType',
                Property  : 'to_musican.name',
                Descending: false
            }]
        }
    },
    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Musican Page Header

    UI : {
        HeaderInfo: {
            Title                  : {
                $Type: 'UI.DataField',
                Value: to_band.bandName
            },
            TypeName               : '{i18n>Orchester}',
            TypeNamePlural         : '{i18n>Orchesters}',
            Description            : {Value: to_band.genre}
        },
            FieldGroup #Description: {Data: [
                {
                    $Type: 'UI.DataField',
                    Value: to_musican.musicanID,
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.name,
                    ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.prename,
                    ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.birthdate,
                    ![@UI.Importance]: #High
                }
            ]}
        },
        // Page Facets
        UI.Facets : [{
            $Type : 'UI.CollectionFacet',
            ID    : 'BandMusicanetails',
            Label : '{i18n>details}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>details}',
                Target: '@UI.FieldGroup#Description'

            }]
        }]
   
);

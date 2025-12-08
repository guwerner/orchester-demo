using BandService from '../../srv/band-service';


annotate BandService.Band2Musicans with @(
    // ---------------------------------------------------------------------------
    // List Page
    // ---------------------------------------------------------------------------
    // Musican List Header

    UI : {
        LineItem           : [

            {
                $Type: 'UI.DataField',
                Value: to_musican.musicanID,
                Label: '{i18n>musicanID}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_musican.prename,
                Label: '{i18n>prename}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_musican.name,
                Label: '{i18n>name}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_musican.instrument,
                Label: '{i18n>instrument}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_musican.birthdate,
                Label: '{i18n>birthdate}'
            },
            {
                $Type: 'UI.DataField',
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
                    Value: to_musican_musicanID,
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.name,
                    ![@Common.FieldControl] : #ReadOnly,
                   ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.prename,
                    ![@Common.FieldControl] : #ReadOnly,
                    ![@UI.Importance]: #High
                },
                {
                    $Type            : 'UI.DataField',
                    Value            : to_musican.birthdate,
                   ![@Common.FieldControl] : #ReadOnly,
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

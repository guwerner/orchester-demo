using MusicanService from '../../srv/musican-service';



annotate MusicanService.Band2Musicans with @(
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // Band List
    UI       : {
        LineItem           : [

            {
                Value: to_band.bandID,
                Label: '{i18n>bandID}'
            },
            {
                Value: to_band.bandName,
                Label: '{i18n>bandName}'
            },
            {
                Value: to_band.genre,
                Label: '{i18n>genre}'
            },
            {
                Value: to_band.foundedIn,
                Label: '{i18n>foundedIn}'
            }

        ],
        PresentationVariant: {
            Visualizations: ['@UI.LineItem'],
            SortOrder     : [{
                $Type     : 'Common.SortOrderType',
                Property  : 'to_band.bandName',
                Descending: false
            }]
        }
    },
    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Band Page Header

    UI       : {
        HeaderInfo             : {
            Title         : {
                $Type: 'UI.DataField',
                Value: to_musican.name
            },
            TypeName      : '{i18n>Musican}',
            TypeNamePlural: '{i18n>Musicans}',
            Description   : {Value: to_musican.prename}
        },
        FieldGroup #Description: {Data: [
            {
                $Type: 'UI.DataField',
                Value: to_band.bandID,
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.bandName,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.genre,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.foundedIn,
                ![@UI.Importance]: #High
            }
        ]}
    },
    // Page Facets
    UI.Facets: [{
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
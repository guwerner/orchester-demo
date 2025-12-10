using MusicanService from '../../srv/musican-service';

annotate MusicanService.Band2Musicans with @(
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // Band List
    UI       : {
        LineItem           : [
            
            {
                $Type: 'UI.DataField',
                Value: to_band.bandID,
                Label: '{i18n>bandID}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_band.bandName,
                Label: '{i18n>bandName}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_band.genre,
                Label: '{i18n>genre}'
            },
            {
                $Type: 'UI.DataField',
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
            Description   : {Value: to_band.bandName}
        },
        FieldGroup #Description: {Data: [
            {
                $Type            : 'UI.DataField',
                Value            : (to_band.bandID),
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.bandName,
                ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.genre,
                  ![@Common.FieldControl] : #ReadOnly,
                ![@UI.Importance]: #High
            },
            {
                $Type            : 'UI.DataField',
                Value            : to_band.foundedIn,
                  ![@Common.FieldControl] : #ReadOnly,
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
    },
     {  // Concert list
    $Type  : 'UI.ReferenceFacet',
    ID     : 'ConcertList',
    Target : 'to_band/to_concert/@UI.PresentationVariant',
    Label  : '{i18n>Concerts}'
  }
    ]
);

annotate MusicanService.Band2Concerts with @(
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // Concert List
    UI       : {
        LineItem           : [
            
            {
                $Type: 'UI.DataField',
                Value: to_concert.concertID,
                Label: '{i18n>bandID}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_concert.location,
                Label: '{i18n>location}'
            },
            {
                $Type: 'UI.DataField',
                Value: to_concert.title,
            },
            {
                $Type: 'UI.DataField',
                Value: to_concert.concertDate,
            },
            {
                $Type: 'UI.DataField',
                Value: to_concert.time,
            },
             {
                $Type: 'UI.DataField',
                Value: to_concert.inlettime
            },{
                $Type: 'UI.DataField',
                Value: to_concert.actual
            }
        ],
        PresentationVariant: {
            Visualizations: ['@UI.LineItem'],
            SortOrder     : [{
                $Type     : 'Common.SortOrderType',
                Property  : 'to_concert.title',
                Descending: false
            }]
        }
    }
);
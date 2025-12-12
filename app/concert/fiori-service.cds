using MusicanService from '../../srv/musican-service';

// Concert List Page Annotations
annotate MusicanService.Concert with @(
    UI: {
        LineItem: [
            {$Type: 'UI.DataField', Value: concertID, Label: '{i18n>concertID}'},
            {$Type: 'UI.DataField', Value: title, Label: '{i18n>concertName}'},
            {$Type: 'UI.DataField', Value: concertDate, Label: '{i18n>concertDate}'},
            {$Type: 'UI.DataField', Value: time, Label: '{i18n>concertTime}'},
            {$Type: 'UI.DataField', Value: location, Label: '{i18n>location}'},
            {
                $Type: 'UI.DataField',
                Value: actual,
                Label: '{i18n>actual}',
                Criticality: (actual = false ? 2 : 3)
            }
        ],
        PresentationVariant: {
            Visualizations: ['@UI.LineItem'],
            SortOrder: [{
                $Type: 'Common.SortOrderType',
                Property: 'concertDate',
                Descending: true
            }]
        }
    }
);

// Concert Object Page Annotations
annotate MusicanService.Concert with @(
    UI: {
        HeaderInfo: {
            Title: {
                $Type: 'UI.DataField',
                Value: title
            },
            TypeName: '{i18n>Concert}',
            TypeNamePlural: '{i18n>Concerts}',
            Description: {Value: location}
        },
        FieldGroup #ConcertDetails: {
            Data: [
                {$Type: 'UI.DataField', Value: concertID, Label: '{i18n>concertID}'},
                {$Type: 'UI.DataField', Value: title, Label: '{i18n>concertName}'},
                {$Type: 'UI.DataField', Value: concertDate, Label: '{i18n>concertDate}'},
                {$Type: 'UI.DataField', Value: time, Label: '{i18n>concertTime}'},
                {$Type: 'UI.DataField', Value: inlettime, Label: '{i18n>inletTime}'},
                {$Type: 'UI.DataField', Value: location, Label: '{i18n>location}'},
                {
                    $Type: 'UI.DataField',
                    Value: actual,
                    Label: '{i18n>actual}',
                    Criticality: (actual = false ? 2 : 3)
                }
            ]
        },
        Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                ID: 'ConcertDetails',
                Label: '{i18n>Details}',
                Target: '@UI.FieldGroup#ConcertDetails'
            }
        ]
    }
);

// Band2Concerts inline table annotations
// annotate MusicanService.Band2Concerts with @(
//     UI: {
//         LineItem: [
//             {$Type: 'UI.DataField', Value: to_band.bandID, Label: '{i18n>bandID}'},
//             {$Type: 'UI.DataField', Value: to_band.bandName, Label: '{i18n>bandName}'},
//             {$Type: 'UI.DataField', Value: to_band.genre, Label: '{i18n>genre}'},
//             {$Type: 'UI.DataField', Value: to_band.foundedIn, Label: '{i18n>foundedIn}'}
//         ],
//         PresentationVariant: {
//             Visualizations: ['@UI.LineItem'],
//             SortOrder: [{
//                 $Type: 'Common.SortOrderType',
//                 Property: 'to_band.bandName',
//                 Descending: false
//             }]
//         }
//     }
// );

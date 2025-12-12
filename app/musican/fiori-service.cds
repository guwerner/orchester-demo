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
                Label: '{i18n>bandName}',
                ![@HTML5.LinkTarget]: '_blank',
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

annotate MusicanService.Address with @(UI: {
Identification: [{
        $Type: 'UI.DataField',
        Value: street

    }] ,

LineItem  : [     
    {
        $Type: 'UI.DataField',
        Value: street,
        Label: '{i18n>street}'
    },
    {
        $Type: 'UI.DataField',
        Value: city,
        Label: '{i18n>city}'
    },
    {
        $Type: 'UI.DataField',
        Value: postalCode,
        Label: '{i18n>postalCode}'
    },
    {
        $Type: 'UI.DataField',
        Value: country,
        Label: '{i18n>country}'
    }
], HeaderInfo  : {
    $Type : 'UI.HeaderInfoType',
    TypeName : '{i18n>Address}',
    TypeNamePlural : '{i18n>Addresses}',
    Title : {
        $Type: 'UI.DataField',
        Value: city
    }
},
Facets  : [
    {
      $Type : 'UI.ReferenceFacet',
       Label : '{i18n>Details}',
      Target: '@UI.FieldGroup#Details'
    }
],
 FieldGroup #Details        : {Data: [
        {Value: city},
        {Value: street},
        {Value: country},
        
    ]},

     QuickViewFacets            : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Address}',
        Target: '@UI.FieldGroup#AdressQuickView'
    }],

    FieldGroup #AdressQuickView: {Data: [
        {
            $Type: 'UI.DataField',
            Value: postalCode
        },
        {
            $Type: 'UI.DataField',
            Value: city
        },
        {
            $Type: 'UI.DataField',
            Value: (street),
        },
        {
             $Type: 'UI.DataField',
             Value: country
        }
    ]}
}) ;

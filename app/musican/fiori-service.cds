using MusicanService from '../../srv/musican-service';


////////////////////////////////////////////////////////////////////////////
//
//	Musican Object Page
//
annotate MusicanService.Musican with @(UI : {

    Facets              : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>BandInMusican}',
            Target: 'to_band/@UI.LineItem'
        }
    ],

    FieldGroup #General : {Data : [
        {Value: name},
        {Value: prename},
        {Value: birthdate},
        {
            Value                  : musicanStatus.name,
            Criticality            : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code = #Active ? 3 : 0)),
            LabeL                  : 'i18n>Status',
            ![@Common.FieldControl]: #ReadOnly,
        }
    ]},

});

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
            Description   : {Value: to_band.bandName}
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
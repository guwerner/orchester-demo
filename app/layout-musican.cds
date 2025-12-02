using MusicanService from '../srv/musican-service';

////////////////////////////////////////////////////////////////////////////
//
//	Musican List Page
//
annotate MusicanService.Musican with @(UI : {
    Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.statusActive',
            Label : '{i18n>statusActive}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.statusInactive',
            Label : '{i18n>statusInactive}'
        }
    ],
    SelectionFields: [
        prename,
        name,
        instrument

    ],

    LineItem       : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.statusActive',
            Label : '{i18n>statusActive}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.statusInactive',
            Label : '{i18n>statusInactive}'
        },
        {
            Value: name,
            Label: '{i18n>name}'
        },
        {
            Value: prename,
            Label: '{i18n>prename}'
        },
        {
            Value       : musicanStatus.name,
            Criticality : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code = #Active ? 3 : 0)),
            Label       : '{i18n>status}'
        },
        {
            Value: birthdate,
            Label: '{i18n>birthdate}'
        }
    ]

});

annotate MusicanService.Band with @(UI: {
    HeaderInfo         : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'i18n>Band',
        TypeNamePlural: 'i18n>Bands',
    },
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderTyp',
            property  : bandID,
            Descending: false
        }]

    },
    LineItem           : [
        {
            Value: bandID,
            Label: '{i18n>bandID}'
        },
        {
            Value: bandName,
            Label: '{i18n>bandName}'
        },
        {
            Value: genre,
            Label: '{i18n>genre}'
        },

    ],
    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'BandList',
            Target: '@UI.PresentationVariant',
            Label : '{i18n>Bands}'
        }


    ],
})

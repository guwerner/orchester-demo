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
        },
         {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilityUp',
            Label : '{i18n>abilityUp}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilitydown',
            Label : '{i18n>abilitydown}'
        }
    ],
    SelectionFields: [
        prename,
        name,
        musicanAbility.name,

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
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilityUp',
            Label : '{i18n>abilityUp}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilitydown',
            Label : '{i18n>abilityDown}'
        },
        {
            Value             : name,
            Label             : '{i18n>name}',
            @HTML5.CssDefaults: {width: '9em'}
        },
        {
            Value             : prename,
            Label             : '{i18n>prename}',
            @HTML5.CssDefaults: {width: '9em'}
        },
        {
            Value             : instrument,
            Label             : '{i18n>instrument}',
            @HTML5.CssDefaults: {width: '10em'},
            ![@UI.Importance] : #High
        },
        {
            Value             : musicanStatus.name,
            Criticality       : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code = #Active ? 3 : 0)),
            @HTML5.CssDefaults: {width: '9em'},
            Label             : '{i18n>status}',
            ![@UI.Importance] : #High

        },
        {
            Value             : musicanAbility.name,
            Label             : '{i18n>ability}',
            ![@UI.Importance] : #High,
            @HTML5.CssDefaults: {width: '9em'}
        },
        {
            Value             : birthdate,
            Label             : '{i18n>birthdate}',
            @HTML5.CssDefaults: {width: '9em'},
        }

    ]

});

////////////////////////////////////////////////////////////////////////////
//
//	Musican Object Page
//
annotate MusicanService.Musican with @(UI : {

    Facets             : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>General}',

            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>General}',
                    Target: '@UI.FieldGroup#General'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Status}',
                    Target: '@UI.FieldGroup#Status'
                },

                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Ability}',
                    Target: '@UI.FieldGroup#Ability'
                },
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>BandInMusican}',
            Target: 'to_band/@UI.LineItem'
        }
    ],

    FieldGroup #General: {Data: [
        {Value: name},
        {Value: prename},
        {Value: instrument},
        {Value: birthdate},

    ]},

    FieldGroup #Ability: {Data: [

    {
        Value                  : musicanAbility.name,
        ![@Common.FieldControl]: #ReadOnly
    }]},

    FieldGroup #Status : {Data : [

    {
        Value                  : musicanStatus.name,
        Criticality            : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code = #Active ? 3 : 0)),
        ![@Common.FieldControl]: #ReadOnly,
    }]}


});


annotate MusicanService.Band with @(UI: {
    HeaderInfo         : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'i18n>Band',
        TypeNamePlural: 'i18n>Bands',
        Title         : {Value: bandName}
    },
    PresentationVariant: {
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
        }
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

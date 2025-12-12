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
            Action: 'MusiancService.setAbilityDown',
            Label : '{i18n>abilityDown}'
        },
        {Value: name},
    ],
    HeaderInfo     : {
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        TypeName      : '{i18n>Musican}',
        TypeNamePlural: '{i18n>Musicans}'
    },
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
            $Type  : 'UI.DataFieldForAction',
            Action : 'MusiancService.statusInactive',
            Label  : '{i18n>statusInactive}',
            IconUrl: 'sap-icon://survey'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilityUp',
            Label : '{i18n>abilityUp}'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'MusiancService.setAbilityDown',
            Label : '{i18n>abilityDown}'
        },
        {Value: musicanID},
        {
            Value               : name,
            ![@HTML5.LinkTarget]: '_blank',
            @HTML5.CssDefaults  : {width: '9em'},

        },
        {
            Value             : prename,
            @HTML5.CssDefaults: {width: '9em'}
        },
        {
            Value             : instrument,
            @HTML5.CssDefaults: {width: '10em'},
            ![@UI.Importance] : #High
        },
        {
            Value             : (musicanStatus.code),
            Criticality       : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code = #Active ? 3 : 0)),
            @HTML5.CssDefaults: {width: '9em'},
            ![@UI.Importance] : #High

        },
        {
            Value             : (musicanAbility.code),
            ![@UI.Importance] : #High,
            @HTML5.CssDefaults: {width: '9em'}
        },
        {
            Value             : birthdate,
            @HTML5.CssDefaults: {width: '9em'},
        },
        {Value: address.ID,
        @HTML5.CssDefaults: {width: '9em'}
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
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Admin}',
            Target: '@UI.FieldGroup#Admin'
        }
    ],
    FieldGroup #Admin  : {Data: [
        {
            $Type                  : 'UI.DataField',
            Value                  : createdAt,
            ![@Common.FieldControl]: #ReadOnly

        },
        {
            $Type                  : 'UI.DataField',
            Value                  : createdBy,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            $Type                  : 'UI.DataField',
            Value                  : modifiedAt,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            $Type                  : 'UI.DataField',
            Value                  : modifiedBy,
            ![@Common.FieldControl]: #ReadOnly
        }
    ]},

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



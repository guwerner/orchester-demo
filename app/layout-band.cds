using AdminService from '../srv/admin-service';


////////////////////////////////////////////////////////////////////////////
//
//	Band List Page
//
annotate AdminService.Band with @(UI: {
    SelectionFields: [
        bandName,
        genre

    ],
    LineItem       : [
        {
            Value: bandName,
            Label: '{i18n>Band}'
        },
        {
            Value: genre,
            Label: '{i18n>Genre}'
        },
        {
            Value: foundedIn,
            Label: '{i18n>FoundetIn}'
        }
    ]
});


////////////////////////////////////////////////////////////////////////////
//
//	Musican List Page
//
annotate AdminService.Musican with @(UI: {

    Identification     : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'AdminService.changeStatus',
            Label : '{i18n>ChangeStatus}'
        },
        {Value: musicanID}
    ],

    SelectionFields    : [
        prename,
        name,
        instrument

    ],
    HeaderInfo         : {
        TypeName      : '{i18n>Musican}',
        TypeNamePlural: '{i18n>Musicans}',
        Title         : {Value: prename},
        Description   : {Value: musicanID}
    },
    PresentationVariant: {
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderTyp',
            property  : musicanID,
            Descending: false
        }]
    },

    LineItem           : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'AdminService.changeStatus',
            Label : '{i18n>ChangeStatus}'
        },
        {
            Value: name,
            Label: '{i18n>LastName}'
        },
        {
            Value: prename,
            Label: '{i18n>FirstName}'
        },
        {
            Value: musicanStatus.name,
            Criticality : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code =#Active ? 3 :0)),
            Label: '{i18n>status}'
        },
        {
            Value: birthdate,
            Label: '{i18n>birthdate}'
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
            Label : '{i18n>Details}',
            Target: '@UI.FieldGroup#Details'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Admin}',
            Target: '@UI.PresentationVariant',
        }
       
    ]
});

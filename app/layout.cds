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

    Identification     : [{
        $Type : 'UI.DataFieldForAction',
        Action: 'AdminService.changeStatus',
        Label : '{i18n>ChangeStatus}'
    }],

    SelectionFields    : [
        prename,
        name,
        instrument

    ],
    HeaderInfo         : {
        TypeName      : '{i18n>Musican}',
        TypeNamePlural: '{i18n>Musicans}',
        Title         : {Value: prename},
        Description   : {Value: ID}
    },
    PresentationVariant: {
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderTyp',
            property  : band_ID,
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
            Value: band.bandName,
            Label: '{i18n>Band}'
        },
        {
            Value: status,
            Label: '{i18n>Status}'
        },
        {
            Value: birthdate,
            Label: '{i18n>Birthdate}'
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
            Target: '@UI.FieldGroup#Admin'
        }
    ]
});

using BandService from '../srv/band-service';


////////////////////////////////////////////////////////////////////////////
//
//	Band List Page
//
annotate BandService.Band with @(UI: {
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
annotate BandService.Musican with @(
    
    UI: {
       HeaderInfo         : {
        $Type         : 'UI.HeaderInfoType',
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
    SelectionFields    : [
        prename,
        name,
        instrument

    ],


    LineItem           : [
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'BandService.changeStatus',
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
            Label : '{i18n>Admin}',
            ID:   'MusicanList',
            Target: '@UI.PresentationVariant',
        }
       
    ]
});

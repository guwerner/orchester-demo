using MusicanService from '../srv/musican-service';

////////////////////////////////////////////////////////////////////////////
//
//	Musican List Page
//
annotate MusicanService.Musican with @(UI: {

      SelectionFields    : [
        prename,
        name,
        instrument

    ] ,

    LineItem           : [
        {
            Value: name,
            Label: '{i18n>LastName}'
        },
        {
            Value: prename,
            Label: '{i18n>FirstName}'
        },
        {
            Value: status,
            Label: '{i18n>Status}'
        },
        {
            Value: birthdate,
            Label: '{i18n>Birthdate}'
        }
    ]
    
});
annotate MusicanService.Band with @(UI: {
   HeaderInfo  : {
       $Type : 'UI.HeaderInfoType',
       TypeName : 'i18n>Band',
       TypeNamePlural : 'i18n>Bands',
   },
    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderTyp',
            property  : bandID,
            Descending: false
        }]
        
    },
    LineItem  : [
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
    Facets  : [
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
  

using MusicanService from '../../srv/musican-service';


////////////////////////////////////////////////////////////////////////////
//
//	Musican Object Page
//
annotate MusicanService.Musican with @(UI: {

 Facets             : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>General}',
        Target: '@UI.FieldGroup#General'
    },
     {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>BandInMusican}',
        Target : 'to_band/@UI.LineItem'
    }],

    FieldGroup #General: {Data: [
        {Value: name},
        {Value: prename},
        {Value: birthdate},
        {Value: musicanStatus.name, 
         Criticality : (musicanStatus.code = #Inactive ? 2 : (musicanStatus.code =#Active ? 3 :0))
         }
    ]},

});

annotate MusicanService.BandMembers with @(UI: {
    PresentationVariant: {
        Visualizations: ['@UI.LineItem'],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : 'bandID',
            Descending: false
        }]
    },
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
        }, {
            Value: to_band.foundedIn,
            Label: '{i18n>foundedIn}'
        }
       
    ],
    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'BandList',
        Target: 'to_band/@UI.PresentationVariant',
        Label : '{i18n>BandInMusican}'
    }

    ],
});
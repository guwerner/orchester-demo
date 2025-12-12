using MusicanService from '../../srv/musican-service';

// Field controls and value lists for Concert
annotate MusicanService.Concert with {
    concertID @Core.Computed;
    
    title @(
        title: '{i18n>concertName}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
    
    concertDate @(
        title: '{i18n>concertDate}',
        Common.ValueListWithFixedValues: false,
     Common.FieldControl: #Mandatory
    );
    
    time @(
        title: '{i18n>concertTime}',
        Common.ValueListWithFixedValues: false,
        Common.FieldControl: #Mandatory
    );
    
    inlettime @(
        title: '{i18n>inletTime}',
        Common.ValueListWithFixedValues: false
    );
    
    location @(
        title: '{i18n>location}',
        Common.ValueListWithFixedValues: false
    );
    
    actual @(
        title: '{i18n>actual}',
        Common.FieldControl: #ReadOnly
    );
}

// Band2Concerts field controls
annotate MusicanService.Band2Concerts with {
    ID @Core.Computed;
    
    to_band @Common.ValueList: {
        @Common.Text: to_band.bandName,
        @Common.TextArrangement: #TextOnly,
        CollectionPath: 'Band',
        Label: '{i18n>Band}',
        Parameters: [
            {
                $Type: 'Common.ValueListParameterInOut',
                LocalDataProperty: 'to_band_bandID',
                ValueListProperty: 'bandID'
            },
            {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'bandName'
            },
            {
                $Type: 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'genre'
            }
        ]
    };
    
    to_concert @Common.FieldControl: #ReadOnly;
}

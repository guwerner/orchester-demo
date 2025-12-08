using MusicanService from '../../srv/musican-service';

//
// annotations that control the behavior of fields and actions
//

annotate MusicanService.Musican with actions {
    statusInactive @(
        Core.OperationAvailable            : ($self.musicanStatus.code != #Inactive),
        Common.SideEffects.TargetProperties: [
            'in/musicanStatus_code',
            'in/musicanStatus'
        ],
    );
    statusActive   @(
        Core.OperationAvailable            : ($self.musicanStatus.code != #Active),
        Common.SideEffects.TargetProperties: [
            'in/musicanStatus_code',
            'in/musicanStatus'
        ],
    );
    setAbilityUp   @(
        Core.OperationAvailable            : ($self.musicanAbility.code < 5),
        Common.SideEffects.TargetProperties: [
            'in/musicanAbility_code',
            'in/musicanAbility'
        ],
    );
    setAbilityDown @(
        Core.OperationAvailable            : ($self.musicanAbility.code > 1),
        Common.SideEffects.TargetProperties: [
            'in/musicanAbility_code',
            'in/musicanAbility'
        ],

    );
}


annotate MusicanService.Musican with {
    musicanStatus @(
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'MusicanStatus',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'musicanStatus_code',
                    ValueListProperty: 'musicanStatus_code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'musicanStatus.name'
                },
            ]
        }
    )
}


annotate MusicanService.Band2Musicans with {
    ID         @Core.Computed;
    to_band    @Common.ValueList: {
        CollectionPath: 'Band',
        Label         : '',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'to_band_bandID',
                ValueListProperty: 'bandID'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'bandName'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'genre'
            }
        ]
    };
    to_musican @(
        Common.Text                    : to_musican.name,
        Common.TextArrangement         : #TextOnly,
        title                          : '{i18n>Musican}',
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'Musican',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'to_musican_musicanID',
                    ValueListProperty: 'nusicanID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                },
            ]
        }
    );
    joinDate   @Core.Computed

};

annotate MusicanService.Band with @(
    title             : '{i18n>Orchester}',
    UI.TextArrangement: #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey: [bandName],
    UI.Identification : [{
        $Type: 'UI.DataField',
        Value: bandName

    }, ]
) {
    bandID   @(
        Core.Computed,
        Common.Text           : bandName,
        Common.TextArrangement: #TextOnly
    );
    genre
             @(
        title                          : '{i18n>Genre}',
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'GenreView',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'genre',
                ValueListProperty: 'genre'
            }]
        }
    );
    bandName @(
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath                 : 'Band',
            Common.ValueListWithFixedValues: false,
            Label                          : 'Band ID',
            Parameters                     : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'bandName',
                    ValueListProperty: 'bandName'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'genre'
                }
            ]
        }
    )
};

annotate MusicanService.Musican with {
    musicanID @(
        Core.Computed,
        Common.Text            : name,
        Common.TextArrangement : #TextOnly
    );
    name @(
        title                           : '{i18n>Name}',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'Musican',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'name',
                ValueListProperty : 'name'
            }]
        }

    );
    instrument
    @(
        title                          : '{i18n>Instrument}',
        Common.ValueListWithFixedValues: false,
        Common.ValueList               : {
            CollectionPath: 'InstrumentView',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: 'instrument',
                ValueListProperty: 'instrument'
            }]
        }
    )
};

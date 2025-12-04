using MusicanService from '../../srv/musican-service';

//
// annotations that control the behavior of fields and actions
//

annotate MusicanService.Musican with 
actions {
    statusInactive @(
    Core.OperationAvailable : ($self.musicanStatus.code != #Inactive),
    Common.SideEffects.TargetProperties : ['in/musicanStatus_code', 'in/musicanStatus' ],
    );
    statusActive @(
    Core.OperationAvailable : ($self.musicanStatus.code != #Active),
    Common.SideEffects.TargetProperties : ['in/musicanStatus_code', 'in/musicanStatus'],        
    );
    setAbilityUp @(
    Core.OperationAvailable : ($self.musicanAbility.code < 5 ),
    Common.SideEffects.TargetProperties : ['in/musicanAbility_code', 'in/musicanAbility'],        
    );
    setAbilityDown @(
    Core.OperationAvailable : ($self.musicanAbility.code > 1 ),
    Common.SideEffects.TargetProperties : ['in/musicanAbility_code', 'in/musicanAbility'],   

    );
}    


annotate MusicanService.Musican with {
    musicanStatus @(
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'MusicanStatus',
            Parameters     : [{
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'musicanStatus_code',
                ValueListProperty : 'musicanStatus_code'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'musicanStatus.name'
            },
            ]
        }
    )
}


annotate MusicanService.Band2Musicans with {
     ID     @Core.Computed;
     to_band   @(
        Common.Text                     : to_band.bandName,
        Common.TextArrangement          : #TextOnly,
        title                           : '{i18n>bandName}',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'Band',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'bandID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'bandName'
                },
            ]
        }
    );
    to_musican @(
        Common.Text                     : to_musican.name,
        Common.TextArrangement          : #TextOnly,
        title                           : '{i18n>Musican}',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'Musican',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'musicanID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
            ]
        }
    );
    joinDate @Core.Computed
     
};

annotate MusicanService.Band with {
    genre
    @(
       title                           : '{i18n>Genre}',
        Common.ValueListWithFixedValues : false,
        Common.ValueList                : {
            CollectionPath : 'GenreView',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'genre',
                    ValueListProperty : 'genre'
                }
            ]
        }
    );

}
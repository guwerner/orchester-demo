using MusicanService from '../../srv/musican-service';

//
// annotations that control the behavior of fields and actions
//

annotate MusicanService.Musican with 
actions {
    statusInactive @(
    Core.OperationAvailable : ($self.musicanStatus.code != #Inactive),
    Common.SideEffects.TargetProperties : ['in/MusicanStatus_code'],
    );
    statusActive @(
    Core.OperationAvailable : ($self.musicanStatus.code != #Active),
    Common.SideEffects.TargetProperties : ['in/MusicanStatus_code'],        
    )
};

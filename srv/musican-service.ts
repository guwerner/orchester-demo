import cds from '@sap/cds';
import { Musican, MusicanStatus } from '#cds-models/MusicanService';
import { MusicanStatusCode } from '#cds-models/orchester';
export class MusicanService extends cds.ApplicationService {
  async init() {

    //
    // Action Implementations...
    //

    const { statusActive, statusInactive} = Musican.actions;
    this.before([statusActive], [Musican, Musican.drafts], async (req) => {
    const existingDraft = await SELECT.one(Musican.drafts.name).where(req.params[0])
      .columns(musican => { musican.DraftAdministrativeData.InProcessByUser.as('InProcessByUser') } )
    // action called on active -> reject if draft exists
    // action called on draft -> reject if not own draft
    const isDraft = req.target.name.endsWith('.drafts')
    if (!isDraft && existingDraft || isDraft && existingDraft?.InProcessByUser !== req.user.id)
      throw req.reject(423, `The musican is locked by ${existingDraft.InProcessByUser}.`);
    })
    this.on (statusActive, async req => { 
     let succeeded =  await UPDATE (req.subject).with({ musicanStatus_code : MusicanStatusCode.Active }) 
     if (succeeded) {
        const reloadMusican = await SELECT.one(Musican).from(Musican). where(req.params[0])
        console.log ("bin nun hier auch ! " + reloadMusican?.musicanStatus_code );
     }else{
       console.log ("bin nun hier auch fehkler!");
      return "ging NICHT"
     }
    })
    this.on (statusInactive, req => UPDATE (req.subject).with({ musicanStatus_code : MusicanStatusCode.Inactive }) ) ;
    
    return super.init()
  }
}




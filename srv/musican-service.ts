import cds from '@sap/cds';
import { Musican, Concert } from '#cds-models/MusicanService';
import { MusicanStatusCode } from '#cds-models/orchester';
import { CdsDate } from '#cds-models/_';
export class MusicanService extends cds.ApplicationService {
  async init() {

    this.after("each", Concert, async (concert: Concert) => {
      const actRecord = await SELECT.one(Concert).where({ concertID: concert?.concertID })
      concert.actual = new Date(actRecord?.concertDate || new Date()).getTime() > new Date().getTime();

    });

    //
    // Action Implementations...
    //

    const { statusActive, statusInactive, setAbilityUp, setAbilityDown } = Musican.actions;
    this.before([statusActive], [Musican, Musican.drafts], async (req) => {
      const existingDraft = await SELECT.one(Musican.drafts.name).where(req.params[0])
        .columns(musican => { musican.DraftAdministrativeData.InProcessByUser.as('InProcessByUser') })
      // action called on active -> reject if draft exists
      // action called on draft -> reject if not own draft
      const isDraft = req.target.name.endsWith('.drafts')
      if (!isDraft && existingDraft || isDraft && existingDraft?.InProcessByUser !== req.user.id)
        throw req.reject(423, `The musican is locked by ${existingDraft.InProcessByUser}.`);
    })
    this.on(statusActive, async req => {
      let succeeded = await UPDATE(req.subject).with({ musicanStatus_code: MusicanStatusCode.Active })
      if (succeeded) {
        const reloadMusican = await SELECT.one(Musican).from(Musican).where(req.params[0])
        console.log("Geht doch " + reloadMusican?.musicanStatus_code);
      } else {
        console.log("bin nun hier Fehler! ");
      }
    })
    this.on(statusInactive, req => UPDATE(req.subject).with({ musicanStatus_code: MusicanStatusCode.Inactive }));

    this.on(setAbilityUp, req => UPDATE(req.subject).set`musicanAbility_code = musicanAbility_code +  1`);
    this.on(setAbilityDown, req => UPDATE(req.subject).set`musicanAbility_code = musicanAbility_code - 1`)



    return super.init()
  }
}




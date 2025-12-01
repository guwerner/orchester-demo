import cds from '@sap/cds';
//import { Musican } from './band-service.cds';
export class BandService extends cds.ApplicationService {
  init() {


    // Handler for the CreateMusican action declared in the service CDS

    //  async function(req: cds.Request, next: Function, fields?: String[] ) {
    //  if (fields && !fields.some(f => f in req.data)) return next() //> skip if no relevant data changed
    //  const musican = (req.data as Musican).musicanID || ( await SELECT.one 'Musican.musicanID as id' .from (req.subject) ).id

    //    try {
    //       const changeMusican = await tx.run(
    //         SELECT(Musican).where({ ID: req.params[0].ID })
    //      );
    //       const changeStatus = await tx.run(
    //         UPDATE(Musican).where({ ID: req.params[0].ID }).set({status: change, Musican[0].status  ? false : true}) 
    //      );
    //      req.info(200, 'Status changed successfully')
    //      return cds.tx(req).run(SELECT.one(Musican).where({ ID: req.params[0].ID }));

    //  } catch (err) {
    //      log.error('Error changing status of Musican:', err)
    //      req.error(500, 'STATUS_CHANGE_FAILED')
    //    }

    //}
    async function hello(req: cds.Request) {
      return 'Test ${req.data.tp}'
    }



    return super.init()
  }}

  //
  // Action Implementations...
  //



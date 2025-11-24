import cds from '@sap/cds';

 export class AdminService extends cds.ApplicationService { init() {
   

  //  // Handler for the CreateMusican action declared in the service CDS
  //  async function[changeStatus(ID: guui) {
  //    const tx = await cds.tx(req);
  //    log.info('changeStatus called') 
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

 //  })

   return super.init()
}}

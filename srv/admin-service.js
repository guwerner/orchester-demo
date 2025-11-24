const cds = require('@sap/cds')
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql')
const LOG = cds.log('admin-service')

module.exports = async function (srv) {
  const { Musican } = srv.entities
  const { INSERT, SELECT, update } = cds.ql ? cds.ql : cds

   const { changeStatus } = Musican.actions;
  // Handler for the CreateMusican action declared in the service CDS
  srv.on([changeStatus], 'Musican', async (req) => {
    const tx = await cds.tx(req);
    LOG.info('changeStatus called') 
    try {
       const changeMusican = await tx.run(
         SELECT(Musican).where({ ID: req.params[0].ID })
      );
       const changeStatus = await tx.run(
         UPDATE(Musican).where({ ID: req.params[0].ID }).set({status: changeMusican[0].status  ? false : true}) 
      );
      req.info(200, 'Status changed successfully')
      return changeStatus;
  
  } catch (err) {
      LOG.error('Error changing status of Musican:', err)
      req.error(500, 'STATUS_CHANGE_FAILED')
    }

  })
}
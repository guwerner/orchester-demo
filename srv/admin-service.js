const cds = require("@sap/cds");
const LOG = cds.log("admin-service");

module.exports = async function (srv) {
  const { Muisan } = srv.entities;

    srv.after("create","Musican", async (req) => {
      LOG.info("Musican - after create, ID");
      try {
        query: cds.insert.into(Muisan).entries({
          ID: req.ID,
          name: req.name,
          prename: req.prename,
            instrument: req.instrument, 
            birthdate: req.birthdate,   
            band_ID: req.band_ID
        });
    }catch  (err) {
      LOG.error("Error in after create Musican:", err.message);
    }      
    })
}
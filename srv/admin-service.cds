using orchester as db from '../db/schema';

service AdminService @(impl: './admin-service.js') {

  entity Musican as projection on db.Musican
    actions {
     action changeStatus();
    }
    
  entity Band           as projection on db.Band;
  entity Concert        as projection on db.Concert;
  entity InstrumentType as projection on db.InstrumentType;

};

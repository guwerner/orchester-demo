using orchester as db from '../db/schema';

service MusicanService @() {

  entity Musican as projection on db.Musican
    actions {
     action changeStatus();
    }
    
  entity Band           as projection on db.Band;
  entity Concert        as projection on db.Concert;
  entity BandMembers    as projection on db.BandMembers {
        * , to_musican : redirected to  Musican, to_band  : redirected to Band
  };
  entity InstrumentType as projection on db.InstrumentType;
  entity Stage          as projection on db.Stage;
  entity MusicanStatus  as projection on db.MusicanStatus;

};

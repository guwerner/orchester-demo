using orchester as db from '../db/schema';

service BandService @() {

  entity Musican as projection on db.Musican
    actions {
     action changeStatus();
    }
    function hello (to:String) returns String;
    
  entity Band           as projection on db.Band;
  entity Concert        as projection on db.Concert;
  entity BandMembers    as projection on db.BandMembers {
        * , to_band : redirected to  Band, to_musican  : redirected to Musican
  };
  entity InstrumentType as projection on db.InstrumentType;
  entity Stage          as projection on db.Stage;
  entity MusicanStatus  as projection on db.MusicanStatus;

};

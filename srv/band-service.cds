using orchester as db from '../db/schema';

service BandService @(path: '/band') {

  entity Musican as projection on db.Musican actions {
     
    }
   

  entity Band           as projection on db.Band;
  entity Concert        as projection on db.Concert;
  entity Band2Musicans    as projection on db.Band2Musicans {
        * , to_band : redirected to  Band, to_musican  : redirected to Musican
  };
  entity InstrumentType as projection on db.InstrumentType;
  entity Stage          as projection on db.Stage;
  entity MusicanStatus  as projection on db.MusicanStatus;
  entity MusicanAblitity as projection on db.MusicanAblitity;

};

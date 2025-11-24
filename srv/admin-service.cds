using orchester as db from '../db/schema';
using {sap} from '@sap/cds/common';

service AdminService @(
  impl    : './admin-service.js',
) {

  entity Musican        as projection on db.Musican;
  entity Band           as projection on db.Band;  
  entity Concert        as projection on db.Concert;
  entity InstrumentType as projection on db.InstrumentType;
}
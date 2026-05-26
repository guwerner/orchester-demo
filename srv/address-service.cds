  using orchester as db from '../db/schema';

service AddressService @(path: '/address', requires: ['Admin', 'BandManager']) {
  
  entity Address as projection on db.Address;

}
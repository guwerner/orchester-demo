  using orchester as db from '../db/schema';

service AddressService @(path: '/address') {
  
  entity Address as projection on db.Address;

}
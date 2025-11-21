using orchester as db from '../db/schema';
using {sap} from '@sap/cds/common';

service AdminService @(
  impl    : './admin-service.js',
) {
  @odata.draft.enabled
  entity Musican       as projection on db.Musican
    actions {
      action approve();
      action rejection();
    };
}
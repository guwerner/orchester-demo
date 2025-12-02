import cds from '@sap/cds';
import { Musican, Band } from '#cds-models/MusicanService';
export class BandService extends cds.ApplicationService {
  init() {
   
    async function hello(req: cds.Request) {
      return 'Test ${req.data.tp}'
    }

    
    return super.init()
  }}

  //
  // Action Implementations...
  //



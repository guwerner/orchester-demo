"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.BandService = void 0;
const cds_1 = __importDefault(require("@sap/cds"));
class BandService extends cds_1.default.ApplicationService {
    init() {
        //  // Handler for the CreateMusican action declared in the service CDS
        //  async function[changeStatus(ID: guui) {
        //    const tx = await cds.tx(req);
        //    log.info('changeStatus called') 
        //    try {
        //       const changeMusican = await tx.run(
        //         SELECT(Musican).where({ ID: req.params[0].ID })
        //      );
        //       const changeStatus = await tx.run(
        //         UPDATE(Musican).where({ ID: req.params[0].ID }).set({status: change, Musican[0].status  ? false : true}) 
        //      );
        //      req.info(200, 'Status changed successfully')
        //      return cds.tx(req).run(SELECT.one(Musican).where({ ID: req.params[0].ID }));
        //  } catch (err) {
        //      log.error('Error changing status of Musican:', err)
        //      req.error(500, 'STATUS_CHANGE_FAILED')
        //    }
        //  })
        return super.init();
    }
}
exports.BandService = BandService;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYWRtaW4tc2VydmljZS5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbImFkbWluLXNlcnZpY2UudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7O0FBQUEsbURBQTJCO0FBRTFCLE1BQWEsWUFBYSxTQUFRLGFBQUcsQ0FBQyxrQkFBa0I7SUFBRyxJQUFJO1FBRzlELHVFQUF1RTtRQUN2RSwyQ0FBMkM7UUFDM0MsbUNBQW1DO1FBQ25DLHNDQUFzQztRQUN0QyxXQUFXO1FBQ1gsNENBQTRDO1FBQzVDLDBEQUEwRDtRQUMxRCxVQUFVO1FBQ1YsMkNBQTJDO1FBQzNDLG9IQUFvSDtRQUNwSCxVQUFVO1FBQ1Ysb0RBQW9EO1FBQ3BELG9GQUFvRjtRQUVwRixtQkFBbUI7UUFDbkIsMkRBQTJEO1FBQzNELDhDQUE4QztRQUM5QyxPQUFPO1FBRVIsTUFBTTtRQUVKLE9BQU8sS0FBSyxDQUFDLElBQUksRUFBRSxDQUFBO0lBQ3RCLENBQUM7Q0FBQztBQXpCRCxvQ0F5QkMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgY2RzIGZyb20gJ0BzYXAvY2RzJztcclxuXHJcbiBleHBvcnQgY2xhc3MgQWRtaW5TZXJ2aWNlIGV4dGVuZHMgY2RzLkFwcGxpY2F0aW9uU2VydmljZSB7IGluaXQoKSB7XHJcbiAgIFxyXG5cclxuICAvLyAgLy8gSGFuZGxlciBmb3IgdGhlIENyZWF0ZU11c2ljYW4gYWN0aW9uIGRlY2xhcmVkIGluIHRoZSBzZXJ2aWNlIENEU1xyXG4gIC8vICBhc3luYyBmdW5jdGlvbltjaGFuZ2VTdGF0dXMoSUQ6IGd1dWkpIHtcclxuICAvLyAgICBjb25zdCB0eCA9IGF3YWl0IGNkcy50eChyZXEpO1xyXG4gIC8vICAgIGxvZy5pbmZvKCdjaGFuZ2VTdGF0dXMgY2FsbGVkJykgXHJcbiAgLy8gICAgdHJ5IHtcclxuICAvLyAgICAgICBjb25zdCBjaGFuZ2VNdXNpY2FuID0gYXdhaXQgdHgucnVuKFxyXG4gIC8vICAgICAgICAgU0VMRUNUKE11c2ljYW4pLndoZXJlKHsgSUQ6IHJlcS5wYXJhbXNbMF0uSUQgfSlcclxuICAvLyAgICAgICk7XHJcbiAgLy8gICAgICAgY29uc3QgY2hhbmdlU3RhdHVzID0gYXdhaXQgdHgucnVuKFxyXG4gIC8vICAgICAgICAgVVBEQVRFKE11c2ljYW4pLndoZXJlKHsgSUQ6IHJlcS5wYXJhbXNbMF0uSUQgfSkuc2V0KHtzdGF0dXM6IGNoYW5nZSwgTXVzaWNhblswXS5zdGF0dXMgID8gZmFsc2UgOiB0cnVlfSkgXHJcbiAgLy8gICAgICApO1xyXG4gIC8vICAgICAgcmVxLmluZm8oMjAwLCAnU3RhdHVzIGNoYW5nZWQgc3VjY2Vzc2Z1bGx5JylcclxuICAvLyAgICAgIHJldHVybiBjZHMudHgocmVxKS5ydW4oU0VMRUNULm9uZShNdXNpY2FuKS53aGVyZSh7IElEOiByZXEucGFyYW1zWzBdLklEIH0pKTtcclxuICBcclxuICAvLyAgfSBjYXRjaCAoZXJyKSB7XHJcbiAgLy8gICAgICBsb2cuZXJyb3IoJ0Vycm9yIGNoYW5naW5nIHN0YXR1cyBvZiBNdXNpY2FuOicsIGVycilcclxuICAvLyAgICAgIHJlcS5lcnJvcig1MDAsICdTVEFUVVNfQ0hBTkdFX0ZBSUxFRCcpXHJcbiAgLy8gICAgfVxyXG5cclxuIC8vICB9KVxyXG5cclxuICAgcmV0dXJuIHN1cGVyLmluaXQoKVxyXG59fVxyXG4iXX0=
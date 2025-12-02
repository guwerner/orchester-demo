"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.onPress = onPress;
const MessageToast_1 = __importDefault(require("sap/m/MessageToast"));
/**
 * Generated event handler.
 *
 * @param this reference to the 'this' that the event handler is bound to.
 * @param event the event object provided by the event provider
 */
function onPress(event) {
    MessageToast_1.default.show("Custom handler invoked.");
}
//# sourceMappingURL=CustomSection.js.map
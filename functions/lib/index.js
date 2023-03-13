"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.pushToPending = void 0;
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
admin.initializeApp();
const db = admin.firestore();
exports.pushToPending = functions.firestore
    .document("messages/{isVerified}")
    .onUpdate((change, context) => {
    const message = change.after.data();
    db.doc("pending/{document}").set(message);
});
//# sourceMappingURL=index.js.map
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//

admin.initializeApp();
const db = admin.firestore();

export const pushToPending = functions.firestore
  .document("messages/{isVerified}")
  .onUpdate((change, context) => {
    const message = change.after.data();

    db.doc("pending").create(message);
  });

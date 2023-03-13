import * as functions from "firebase-functions";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//

export const pushToPending = functions.firestore
  .document("messages/{isVerified}")
  .onUpdate((change, context) => {
    const message = change.after.data();

    functions.logger.log(message);
  });

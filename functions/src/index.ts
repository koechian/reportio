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

    db.doc(`pending/+${makeid(8)}`).create(message);
  });

/**
 * Creates a random id .
 * @param {number} length The first number.
 * @returns {string} The sum of the two numbers.
 */

function makeid(length: number): string {
  let result = "";
  const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

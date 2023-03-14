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

    let newmessage = {
      body: `${message.get("Message  Type")}\n${message.get(
        "Message Content"
      )} \n Location: ${message.get("Referenced Location")}`,
      to: "+254799038737",
    };

    // copies the verified message to the pending document
    db.doc(`pending/${makeid(20)}`).create(newmessage);

    // deletes the verified message from the messages pool
    db.doc(`messages/${change.before.id}`).delete();
  });

function makeid(length: number): string {
  let result = "";
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}

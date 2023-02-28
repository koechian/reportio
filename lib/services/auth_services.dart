import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  //google sign in

  signInWithGoogle() async {
    // ask user to sign in to google

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth details after signin
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    // user auth details to make new creds for user
    final credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);

    // sign in with creds

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

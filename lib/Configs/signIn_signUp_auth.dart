import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_e_commerce_app/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninSignup {
  static Future<AuthResponse> googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = '615984429695-mfsc1o26ge788frdredgrl1p1fo4ndee.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const androidClientId = '615984429695-f4qcg7eottotc5ha1lnjvip5r0tegqn0.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: androidClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
  static Future<AuthResponse> signInwithEmailandPassword({required String email,required String password})async{
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password
      );

  }
  static Future<AuthResponse> signUpwithEmailandPassword({required String email,required String password})async{
    return await supabase.auth.signUp(
      email: email,
      password: password);
     
  } 

}
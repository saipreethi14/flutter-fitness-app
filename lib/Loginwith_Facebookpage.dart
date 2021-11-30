import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Loginwith_facebookpage extends StatefulWidget {

  @override
  _Loginwith_facebookpageState createState() => _Loginwith_facebookpageState();
}

class _Loginwith_facebookpageState extends State<Loginwith_facebookpage> {

  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Facebook"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("User Email: "), Text(userEmail)],
              ),
            ),
            ElevatedButton(onPressed: () async {
              await signInWithFacebook();

              setState(() {});
            }, child: Text("Login with facebook")),

            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              userEmail = "";
              await FacebookAuth.instance.logOut();
              setState(() {

              });
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile', 'user_birthday']
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}

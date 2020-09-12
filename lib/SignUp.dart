import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'file:///D:/android_project/flutter_app/signin_method_flutter/lib/signin/EmailLogIn.dart';
import 'package:signin_method_flutter/signin/SigninWithGoogle.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Meet Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SignInButton(
                      Buttons.Email,
                      text: "Sign up with Email",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmailLogIn()),
                        );
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () async {
                        await signInWithGoogle().then((String value) {
                          print(value);
                          print("success");
//                          signOutGoogle();
                        }).catchError((e) {
                          signOutGoogle();
                          print("error");
                        });
                      },
                    )),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    child: Text("Anonymously"),
                    onPressed: () async {
                      await _signInAnonymously();
                    },
                  ),
                )
              ]),
        ));
  }

  Future<FirebaseAuth> _signInAnonymously() async {
    firebaseAuth.signInAnonymously().then((result) {
      debugPrint("success");
    }).catchError((err) {
      debugPrint(err);
      debugPrint("Error");
    });
    return firebaseAuth;
  }
}

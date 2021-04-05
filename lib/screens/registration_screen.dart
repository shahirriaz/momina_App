import 'package:flutter/material.dart';
import 'package:momina_app/components/rounded_button.dart';
import 'package:momina_app/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:momina_app/screens/home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:momina_app/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  controller: _email,
                  style: TextStyle(color: kLabelColor),
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email', errorText: _validate ? 'Email Can\'t Be Empty' : null),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  controller: _password,
                  style: TextStyle(color: kLabelColor),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password', errorText: _validate ? 'Password Can\'t Be Empty' : null),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    setState(() {
                      _email.text.isEmpty ? _validate = true : _validate =
                      false;
                    });
                    if (_validate == false) {
                      try {
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password).then((user) {
                          Navigator.pushNamed(context, HomeScreen.id);

                          setState(() {
                            showSpinner = false;
                          });
                        }).catchError((e) {
                          showAlertDialog(context, 'Log in failed',
                              'Please check your spelling and try again');
                          setState(() {
                            showSpinner = false;
                          }); // code, message, details
                        });
                      } catch (e) {
                        print(e);
                      }

                    }else{
                      print(_validate);
                      setState(() {
                        showSpinner = false;
                      });
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context, String message, String title) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: kActiveCardColourPrimary,
    title: Text(title,
      style: kLabelTextStyle,
    ),
    content: Text(message,
      style: kLabelTextStyle,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'consts.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Networking {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;



  void getCurrentUser() async {
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> validateInputFromMilkScreenAndSendToFireBase({BuildContext context, int amount, String type, String comment}) async {

    getCurrentUser();

    try{
      if(amount != null && type != null || comment != null){
        _firestore.collection('milk').add({
          'amount': amount,
          'type' : type,
          'comment' : comment,
          'sender' : loggedInUser.email,
          'date': FieldValue.serverTimestamp(),
        });
        Navigator.pop(context);

      }else {
        showAlertDialog(context,
            'Please fill out type and amount',
          'Required fields missing'
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> validateInputFromPoopScreenAndSendToFireBase({BuildContext context, String poopColor, double consistency, String amount}) async {

    getCurrentUser();

    try{
      if(poopColor != null && consistency != null && amount != null){
        _firestore.collection('poop').add({
          'amount': amount,
          'color' : poopColor,
          'consistency' : consistency,
          'sender' : loggedInUser.email,
          'date': FieldValue.serverTimestamp(),
        });
        Navigator.pop(context);

      }else {
        showAlertDialog(context, 'Oups something went wrong, we are trying to fix it',
            'What happned? maybe an error, please try again');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> validateInputFromHomeMoodScreenAndSendToFireBase({BuildContext context, String mood}) async {

    getCurrentUser();

    try{
      if(mood != null){
        _firestore.collection('mood').add({
          'mood': mood,
          'sender' : loggedInUser.email,
          'date': FieldValue.serverTimestamp(),
        });
        Navigator.pop(context);

      }else {
        showAlertDialog(context, 'Oups something went wrong, we are trying to fix it',
            'What happned? maybe an error, please try again');
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> validateInputFromHomeAwakeScreenAndSendToFireBase({BuildContext context, String awake}) async {

    getCurrentUser();

    try{


        _firestore.collection('sleepPattern').add({
          'awake' : awake,
          'sender' : loggedInUser.email,
        });

    } catch (e) {
        print(e);
    }
  }

  Future<void> validateInputFromHomeSleepScreenAndSendToFireBase({BuildContext context, String asleep}) async {

    getCurrentUser();

    try{
        _firestore.collection('sleepPattern').add({
          'asleep' : asleep,
          'sender' : loggedInUser.email,
        });

    } catch (e) {
      print(e);
    }
  }

  Future<void> validateInputFromHomeFITScreenAndSendToFireBase({BuildContext context, String duration}) async {

    getCurrentUser();

    try{
      if(duration != null){
        _firestore.collection('fit').add({
          'duration' : duration,
          'date': FieldValue.serverTimestamp(),
          'sender' : loggedInUser.email,
        });
        Navigator.pop(context);

      }else {
        showAlertDialog(context,
            'Please fill out type and amount',
            'Required fields missing'
        );
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> validateInputFromHomeFoodScreenAndSendToFireBase({BuildContext context, String a, String b, String c, String d, String e, String f}) async {

    getCurrentUser();

    try{
        _firestore.collection('food').add({
          'yakhne' : a,
          'hippGrot' : b,
          'gronnsaksmod ' : b,
          'holleOrganic' : c,
          'havregrot' : d,
          'nestle' : e,
          'sender' : loggedInUser.email,
          'date': FieldValue.serverTimestamp(),
        });

    } catch (e) {
      print(e);
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

}
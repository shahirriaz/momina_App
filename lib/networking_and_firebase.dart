import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'consts.dart';



class Networking {

  final _firestore = FirebaseFirestore.instance;
  
  Future<void> validateInputFromMilkScreenAndSendToFireBase({BuildContext context, int amount, String type, String comment}) async {
    try{
      if(amount != null && type != null || comment != null){
        _firestore.collection('milk').add({
          'amount': amount,
          'type' : type,
          'comment' : comment,
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
    try{
      if(poopColor != null && consistency != null && amount != null){
        _firestore.collection('poop').add({
          'amount': amount,
          'color' : poopColor,
          'consistency' : consistency,
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
    try{
      if(mood != null){
        _firestore.collection('mood').add({
          'mood': mood,
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
    try{

      final currentTime = DateTime.now().hour;

      if(currentTime > 5 && currentTime < 12 ) {
        _firestore.collection('sleepPattern').add({
          'awake' : awake,
        });
      }else {
        showAlertDialog(
            context,
            'Time for register: Awake is between 05 and 12',
            'Important message');
      }

    } catch (e) {
        print(e);
    }
  }

  Future<void> validateInputFromHomeSleepScreenAndSendToFireBase({BuildContext context, String asleep}) async {
    try{

      final currentTime = DateTime.now().hour;

      if(currentTime > 19 && currentTime < 22) {
        _firestore.collection('sleepPattern').add({
          'asleep' : asleep,
        });
      }else {
        showAlertDialog(
            context,
            'Time for register: Asleep is between 18 and 22, registration failed',
            'Important message');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> validateInputFromHomeFITScreenAndSendToFireBase({BuildContext context, String duration}) async {
    try{
      if(duration != null){
        _firestore.collection('fit').add({
          'duration' : duration,
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


  Future<void> validateInputFromHomeFoodScreenAndSendToFireBase({BuildContext context, String a, String b, String c, String d, String e, String f}) async {
    try{
        _firestore.collection('food').add({
          'yakhne' : a,
          'hippGrot' : b,
          'gronnsaksmod ' : b,
          'holleOrganic' : c,
          'havregrot' : d,
          'nestle' : e,
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
import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColourPrimary = Color(0xFFF6EFE8);
const kInactiveCardColourPrimary = Color(0xFFFFFFFF);
const kBottomContainerColor = Color(0xFFe57373);

const kLabelColor = Color(0xFF5A513A);

const kTitleStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF494949)
);


const kSubTitleStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF4B4B4B)
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(fontSize: 13, color: Color(0xFF5A513A),
);

//Poop
const kPoop_container_width = 80.0;
const kPoop_container_height = 80.0;

//Food
const kFood_container_width = 100.0;
const kFood_container_height = 100.0;

const kActiveCardColor = Color(0xFF00FF00);
const kInActiveCardColor1 = Color(0xFFEF9a9a);
const kInactiveCardColor2 = Color(0xFFE57373);
const kInactiveCardColor3 = Color(0xFFEF5350);
const kInactiveCardColor4 = Color(0xFFF44336);
const kInactiveCardColor5 = Color(0xFFD32F2F);
const kInactiveCardColor6 = Color(0xFFF81F1F);



const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);





const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: kLabelColor),
  hintText: 'Enter email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momina_app/icon_content.dart';
import 'package:momina_app/momi_images.dart';
import 'package:momina_app/networking_and_firebase.dart';
import 'reusable_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'consts.dart';
import 'milk_screen.dart';
import 'poop_screen.dart';
import 'food_screen.dart';
import 'package:momina_app/SleepawakeIconData.dart';
import 'package:momina_app/LabelContainter.dart';
import 'package:intl/intl.dart';



String dateFormat;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;
  String selectedMood;

  String asleep;
  String awake;

  var fitDurationformattetToString;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Momi',
            style: TextStyle(color: Color(0xFF424242)),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Reusable_Card(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MilkScreen(),
                        ),
                      );
                      setState(() {
                       //SOMETHING
                      });
                    },
                    colour: kInactiveCardColourPrimary,
                    cardChild: ReusableIcon(
                      icon: MdiIcons.babyBottle,
                      colour: Color(0xFFB1E3FB),
                      label: 'MILK',
                    ),
                  )),
                  Expanded(
                      child: Reusable_Card(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PoopScreen()),
                      );
                      setState(() {
                        //SOMETHING
                      });
                    },
                    colour: kInactiveCardColourPrimary,
                    cardChild: ReusableIcon(
                      icon: MdiIcons.emoticonPoop,
                      colour: Colors.brown,
                      label: 'POOPY',
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
                child:  SizedBox(
                  height: 200, // card height
                  child: PageView.builder(
                    itemCount: 2,
                    controller: PageController(viewportFraction: 0.8),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return buildSwipeCard(i, _index);
                    },
                  ),
                ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Reusable_Card(
                    onPress: () {
                      showBottomSheetTimePicker(context);
                    },
                    colour: kInactiveCardColourPrimary,
                    cardChild: ReusableIcon(
                      icon: MdiIcons.emoticonConfused,
                      colour: Colors.green.shade400,
                      label: 'FIT',
                    ),
                  )),
                  Expanded(
                      child: Reusable_Card(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FoodScreen()),
                      );
                    },
                    colour: kInactiveCardColourPrimary,
                    cardChild: ReusableIcon(
                      icon: MdiIcons.hamburger,
                      colour: Colors.red.shade900,
                      label: 'FOOD',
                    ),
                  )),
                ],
              ),
            ),
          ],
        ));
  }

  Transform buildSwipeCard(int i, int index) {
    if (i == 0) {
      return Transform.scale(
        scale: i == _index ? 1 : 0.9,
        child: buildCardData1(),
      );
    } if (i == 1){
      return Transform.scale(
        scale: i == _index ? 1 : 0.9,
        child: buildCardData2(),
      );
    }
  }

  Card buildCardData2()  {
    return Card(
          color: kInactiveCardColourPrimary,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SleepAwakeIconData(
                    onTap: () {
                      setState(() {
                        DateTime now = DateTime.now();
                        dateFormat = DateFormat('yyyy-MM-dd hh:mm').format(now).toString();
                        asleep = dateFormat;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.pinkAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You registered: $dateFormat',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                      Networking().validateInputFromHomeSleepScreenAndSendToFireBase(context: context, asleep: asleep);
                    },
                    label: 'asleep',
                    imageName: 'images/sleepIcon.png',
                  ),
                  SleepAwakeIconData(
                    onTap: () {
                      setState(() {
                        DateTime now = DateTime.now();
                        dateFormat = DateFormat('yyyy-MM-dd hh:mm').format(now).toString();
                        awake = dateFormat;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.pinkAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You registered: $dateFormat',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                      Networking().validateInputFromHomeAwakeScreenAndSendToFireBase(context: context, awake: awake);
                    },
                    label: 'awake',
                    imageName: 'images/awakeIcon.png',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LabelContainer(
                behaviour: 'sleep',
                iconData: MdiIcons.heartHalfFull,
              ),
            ],
          ),
      );
  }

  Card buildCardData1() {
    return Card(
          color: kInactiveCardColourPrimary,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableProfile(
                    colour: kInactiveCardColourPrimary,
                    onPress: () {
                      setState(() {
                        selectedMood = 'happy';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.pinkAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Happy it is',
                                style: kTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                      Networking().validateInputFromHomeMoodScreenAndSendToFireBase(mood: selectedMood);
                    },
                    imageNumber: 1,
                    label: 'happy',
                  ),
                  ReusableProfile(
                    colour: kInactiveCardColourPrimary,
                    onPress: () {
                      setState(() {
                        selectedMood = 'angry';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.pinkAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Angry it is',
                                style: kTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                      Networking().validateInputFromHomeMoodScreenAndSendToFireBase(mood: selectedMood);
                    },
                    imageNumber: 2,
                    label: 'angry',
                  ),
                  ReusableProfile(
                    colour: kInactiveCardColourPrimary,
                    onPress: () {
                      setState(() {
                        selectedMood = 'bored';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.pinkAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'bored it is',
                                style: kTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                      Networking().validateInputFromHomeMoodScreenAndSendToFireBase(mood: selectedMood);
                    },
                    imageNumber: 3,
                    label: 'bored',
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              LabelContainer(
                behaviour: 'mood',
                iconData: MdiIcons.emoticonOutline,
              ),
            ],
          )
      );
  }

  void showBottomSheetTimePicker(context) {
    Duration initialtimer = new Duration();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 3,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CupertinoButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.ms,
                minuteInterval: 1,
                secondInterval: 5,
                initialTimerDuration: initialtimer,
                onTimerDurationChanged: (Duration changedTimer) {
                  setState(() {
                    initialtimer = changedTimer;
                  });
                  fitDurationformattetToString = initialtimer.toString();
                },
              ),
            ),
            CupertinoButton(
              child: Text("Ok"),
              onPressed: () {
                Networking().validateInputFromHomeFITScreenAndSendToFireBase(duration: fitDurationformattetToString);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}













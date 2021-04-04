import 'package:flutter/material.dart';
import 'package:momina_app/components/checkbox.dart';
import 'package:momina_app/networking_and_firebase.dart';
import '../consts.dart';
import '../components/bottom_button.dart';
import '../components/reusable_poop_image_card.dart';


const kNumberTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

enum PoopColor {
  mustard_yellow,
  yellow_brown,
  black,
  white,
  red,
  green,

}

class PoopScreen extends StatefulWidget {
  static const String id = 'poop_screen';
  @override
  _PoopScreenState createState() => _PoopScreenState();
}

class _PoopScreenState extends State<PoopScreen> {

  PoopColor selectedPoopColor;
  String poopColor;
  String amount;
  double sliderValue = 20;



  bool valLittle = false;
  bool valNormal = false;
  bool valAlot = false;

  String selectedAmount;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'Momi',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: Text('POOP',
                    style: kTitleStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Choose poop color',
                            style: kSubTitleStyle,
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Wrap(
                          spacing: 15.0,
                          runSpacing: 15.0,
                          alignment: WrapAlignment.spaceEvenly,
                          direction: Axis.horizontal,
                          children: [
                            ReusablePoopImageCard(
                              onPress: () {
                                setState(() {
                                  selectedPoopColor = PoopColor.mustard_yellow;
                                  poopColor = 'mustard yellow';
                                });
                              },
                              imageNumber: 1,
                              colour: selectedPoopColor == PoopColor.mustard_yellow ? kActiveCardColor : kInActiveCardColor1,
                            ),

                            ReusablePoopImageCard(
                              onPress: () {
                                setState(() {
                                  selectedPoopColor = PoopColor.yellow_brown;
                                  poopColor = 'yellow brown';
                                });
                              },
                              imageNumber: 2,
                              colour: selectedPoopColor == PoopColor.yellow_brown ? kActiveCardColor : kInactiveCardColor2,
                            ),
                            ReusablePoopImageCard(
                              onPress: () {
                                setState(() {
                                  selectedPoopColor = PoopColor.black;
                                  poopColor = 'black';
                                });
                              },
                              imageNumber: 3,
                              colour: selectedPoopColor == PoopColor.black ? kActiveCardColor : kInactiveCardColor3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Choose consistency',
                            style: kSubTitleStyle
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Slider(
                            value: sliderValue,
                            min: 0,
                            max: 100,
                            divisions: 5,
                            label: sliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                sliderValue = value;
                              });
                            }
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(17.0),
                    decoration: BoxDecoration(
                      color: kInactiveCardColourPrimary,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(2, 3), // changes position of shadow
                        ),
                      ],
                    )
                ),

              ),
              Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Choose amount',
                            style: kSubTitleStyle
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Transform.scale(
                          scale: 1.8,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  // [Monday] checkbox
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Little", style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4B4B4B)
                                      ),),
                                      Checkbox(
                                        value: valLittle,
                                        onChanged: (bool value) {
                                          setState(() {
                                            valLittle = value;
                                            valNormal = false;
                                            valAlot = false;
                                            selectedAmount = 'little';
                                          });
                                        },
                                      ),
                                    ],
                                  ),


                                  // [Tuesday] checkbox
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Normal", style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4B4B4B)
                                      ),
                                      ),
                                      Checkbox(
                                        value: valNormal,
                                        onChanged: (bool value) {
                                          setState(() {
                                            valNormal = value;
                                            valLittle = false;
                                            valAlot = false;
                                            selectedAmount = 'normal';
                                          });
                                        },
                                      ),
                                    ],
                                  ),


                                  // [Wednesday] checkbox
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Alot", style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4B4B4B)
                                      ),),
                                      Checkbox(
                                        value: valAlot,
                                        onChanged: (bool value) {
                                          setState(() {
                                            valAlot = value;
                                            valLittle = false;
                                            valNormal = false;
                                            selectedAmount = 'alot';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        
                        )

                      ],
                    ),
                    margin: EdgeInsets.all(17.0),
                    decoration: BoxDecoration(
                      color: kInactiveCardColourPrimary,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(2, 3), // changes position of shadow
                        ),
                      ],
                    )
                ),
              ),
              BottomButton(
                onTap: () async {
                  Networking().validateInputFromPoopScreenAndSendToFireBase(
                      context: context,
                      poopColor: poopColor,
                      consistency: sliderValue,
                      amount: returnSelectedAmount(selectedAmount) );

                },
                buttonTitle: 'SUBMIT',
              ),

            ],
          )
      );
    }
  }


String returnSelectedAmount(String amount){
  return amount;
}










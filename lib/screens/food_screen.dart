import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momina_app/components/FoodTextField.dart';
import 'package:momina_app/networking_and_firebase.dart';
import 'package:momina_app/components/reusable_food_image_card.dart';
import '../consts.dart';
import '../components/bottom_button.dart';

class FoodScreen extends StatefulWidget {
  static const String id = 'food_screen';
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  String gronnsaksmod;
  String havregrot;
  String hippGrot;
  String holleOrganic;
  String nestle;
  String yakhne;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Momi',
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FOOD',
                    style: kTitleStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Choose food',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4B4B4B)),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 20.0,
                                runSpacing: 15.0,
                                alignment: WrapAlignment.spaceBetween,
                                direction: Axis.vertical,
                                children: [
                                  FoodImageContainer(
                                    imageNumber: 1,
                                    onChange: (value) {
                                      setState(() {
                                        yakhne = value;
                                      });
                                    },
                                    controller: controller1,


                                  ),
                                  FoodImageContainer(
                                    imageNumber: 2,
                                    onChange: (value) {
                                      setState(() {
                                        hippGrot = value;
                                      });
                                    },
                                    controller: controller2,


                                  ),
                                  FoodImageContainer(
                                    imageNumber: 3,
                                    onChange: (value) {
                                      setState(() {
                                        gronnsaksmod = value;
                                      });
                                    },
                                    controller: controller3,


                                  ),
                                  FoodImageContainer(
                                    imageNumber: 4,
                                    onChange: (value) {
                                      setState(() {
                                        holleOrganic = value;
                                      });
                                    },
                                    controller: controller4,


                                  ),
                                  FoodImageContainer(
                                    imageNumber: 5,
                                    onChange: (value) {
                                      setState(() {
                                        havregrot = value;
                                      });
                                    },
                                    controller: controller5,


                                  ),
                                  FoodImageContainer(
                                    imageNumber: 6,
                                    onChange: (value) {
                                      setState(() {
                                        nestle = value;
                                      });
                                    },
                                    controller: controller6,


                                  ),

                                ],
                              ),
                            ],
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
                      )),
                ),
              ),
              BottomButton(
                onTap: () {
                  Networking().validateInputFromHomeFoodScreenAndSendToFireBase(
                      a: yakhne,
                      b: hippGrot,
                      c: gronnsaksmod,
                      d: holleOrganic,
                      e: havregrot,
                      f: nestle);
                  Navigator.pop(context);
                },
                buttonTitle: 'SUBMIT',
              ),
            ],
          ),
        ));
  }
}

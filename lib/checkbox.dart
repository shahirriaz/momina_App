import 'package:flutter/material.dart';


class CheckBoxy extends StatefulWidget {
  @override
  _CheckBoxyState createState() => _CheckBoxyState();
}

class _CheckBoxyState extends State<CheckBoxy> {


  bool valLittle = false;
  bool valNormal = false;
  bool valAlot = false;

  String selectedAmount;


  String returnSelectedAmount(String amount){
    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
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
                      returnSelectedAmount(selectedAmount);
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
                      returnSelectedAmount(selectedAmount);
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
                      returnSelectedAmount(selectedAmount);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }



}


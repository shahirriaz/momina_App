import 'package:flutter/material.dart';
import 'consts.dart';

class LabelContainer extends StatelessWidget {

  LabelContainer({this.behaviour, this.iconData});

  final String behaviour;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              iconData,
              color: Color(0xFF5A513A)
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'choose your $behaviour',
            style: kLabelTextStyle,
          ),
        ],
      ),
      width: 200,
      height: 30,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color(0xFFE6E0D4), borderRadius: BorderRadius.circular(25.0)),
    );
  }
}
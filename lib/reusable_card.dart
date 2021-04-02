import 'package:flutter/material.dart';
import 'package:momina_app/consts.dart';

//home page containers

class Reusable_Card extends StatelessWidget {

  Reusable_Card({this.cardChild, this.colour, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: kInactiveCardColourPrimary,
      splashColor: kActiveCardColourPrimary,
      borderRadius: BorderRadius.circular(25.0),
      onTap: onPress,
      child: Container(
        child: cardChild,
          margin: EdgeInsets.all(17.0),
          decoration: BoxDecoration(
            color: colour,
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
    );
  }
}
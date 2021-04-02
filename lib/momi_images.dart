import 'package:flutter/material.dart';
import 'consts.dart';

class ReusableProfile extends StatelessWidget {
  ReusableProfile(
      {@required this.colour, this.onPress, @required this.imageNumber, this.label});

  final Color colour;
  final Function onPress;
  final int imageNumber;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: InkResponse(
              highlightColor: Colors.pinkAccent.withOpacity(0.5),
              splashColor: Colors.indigo,
              radius: 38,
              borderRadius: BorderRadius.circular(38),
              onTap: onPress,
              child: CircleAvatar(
                  radius: 36.0,
                  backgroundImage: AssetImage('images/momi$imageNumber.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$label', style: kLabelTextStyle,),
          )
        ],
      );
  }
}



import 'package:flutter/material.dart';
import 'consts.dart';



class ReusablePoopImageCard extends StatelessWidget {

  ReusablePoopImageCard({@required this.colour, this.onPress, @required this.imageNumber});

  final Color colour;
  final Function onPress;
  final int imageNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: kPoop_container_width,
        height: kPoop_container_height,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/poop$imageNumber.png'),
            )
        ),
      ),
    );
  }
}
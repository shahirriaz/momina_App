import 'package:flutter/material.dart';


class ReusableIcon extends StatelessWidget {

  ReusableIcon({@required this.icon, @required this.label, @required this.colour
  });

  final IconData icon;
  final String label;
  final Color colour;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colour,
          size: 70.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF505050),
              fontWeight: FontWeight.bold
          ),

        ),
      ],
    );
  }
}
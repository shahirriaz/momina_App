import 'package:flutter/material.dart';
import '../consts.dart';

class SleepAwakeIconData extends StatelessWidget {
  SleepAwakeIconData({@required this.imageName, @required this.label, this.onTap});

  final String imageName;
  final String label;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            highlightColor: Colors.pinkAccent.withOpacity(0.5),
            splashColor: Colors.indigo,
            radius: 50,
            borderRadius: BorderRadius.circular(50),
            child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(5, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image(
                  image: AssetImage('$imageName'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$label', style: kLabelTextStyle,),
          )
        ],
      );
  }
}



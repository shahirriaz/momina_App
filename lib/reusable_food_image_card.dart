import 'package:flutter/material.dart';
import 'consts.dart';
import 'FoodTextField.dart';

class FoodImageContainer extends StatelessWidget {


  final int imageNumber;

  final Function onChange;

  final TextEditingController controller;

  FoodImageContainer({Key key, this.imageNumber, this.onChange, this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: kFood_container_width,
          height: kFood_container_height,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(
                    'images/food$imageNumber.png'),
              )),
          ),
          FoodTextField(controller: controller, onChange: onChange,),
      ],
    );
  }
}

//Todo: add label to each food


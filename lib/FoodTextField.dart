import 'package:flutter/material.dart';
import 'consts.dart';

class FoodTextField extends StatelessWidget {


  final TextEditingController controller;
  final Function onChange;

  const FoodTextField({Key key, this.controller, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: new ThemeData(),
      child: Container(
        width: 200,
        height: 50,
        child: TextField(
          onChanged: onChange,
          keyboardType: TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
                hintText: "enter amount",
                suffixIcon: IconButton(
                  onPressed: () => controller.clear(),
                  icon: Icon(Icons.clear),
                ))),
      ),
    );
  }
}

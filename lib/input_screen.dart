import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  var _controller = TextEditingController();


  String userInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Momina Aplication'
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Type here',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              ),
              onChanged: (value) {
                userInput = value;
              },
            ),
          ),
          TextButton(
            onPressed: () async {
              _controller.clear();
              Uri url = Uri.parse('http://127.0.0.1:5000/');
              final response = await http.post(url, body: json.encode({'name' : userInput}) );


            },
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 30.0,

              ),
            ),
          ),

        ],
      ),
    );
  }
}


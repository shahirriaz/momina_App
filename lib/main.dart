import 'package:flutter/material.dart';
import 'package:momina_app/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFF0EBE5),
        scaffoldBackgroundColor: Color(0xFFF0EBE5),
          unselectedWidgetColor: Colors.red
      ),
        home: HomeScreen(),
    );
  }
}




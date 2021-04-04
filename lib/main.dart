import 'package:flutter/material.dart';
import 'package:momina_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:momina_app/screens/milk_screen.dart';
import 'package:momina_app/screens/poop_screen.dart';
import 'package:momina_app/screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/food_screen.dart';

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
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          FoodScreen.id: (context) => FoodScreen(),
          MilkScreen.id: (context) => MilkScreen(),
          PoopScreen.id: (context) => PoopScreen()
        }
    );
  }
}




import 'package:flutter/material.dart';
import 'Screens/home.page.dart';
import 'Screens/login.page.dart';
import 'Screens/register.page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/register': (context) => Registerpage(),
      '/home': (context) => HomePage(),
    },
    );
  }
}
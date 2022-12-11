import 'package:flutter/material.dart';
import 'package:chat_app/Screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Chat App Clone',
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: const Color(0xff075e54),
          accentColor: const Color(0xff128c7e)),
      home: const MyHomePage(title: 'Chat App Clone'),
    );
  }
}

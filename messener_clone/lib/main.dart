import 'package:flutter/material.dart';
import 'package:messener_clone/messenger_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      home: MessengerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

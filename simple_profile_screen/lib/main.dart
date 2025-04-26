import 'package:flutter/material.dart';
import 'package:simple_profile_screen/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Profile',
      home: ProfilePage(),
    );
  }
}

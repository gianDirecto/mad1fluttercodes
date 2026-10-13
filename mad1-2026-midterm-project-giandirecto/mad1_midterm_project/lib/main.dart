import 'package:flutter/material.dart';
import 'package:mad1_midterm_project/screens/myScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Myscreen());
  }
}

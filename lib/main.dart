import 'package:calculatorapp1/view/calculator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:math_expressions/math_expressions.dart';

// class MyCalculatorPage extends StatefulWidget {
//   const MyCalculatorPage({super.key});

//   @override
//   State<MyCalculatorPage> createState() => _MyCalculatorPageState();
// }

// class _MyCalculatorPageState extends State<MyCalculatorPage> {
//   String inputNum = "0";
//   String answerNum = "0", expression1 = "";
//   double fontSize1 = 35;
//   double fontSize2 = 45;
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height,
//         w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               inputNum,
//               style: TextStyle(color: Colors.white, fontSize: fontSize1),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               answerNum,
//               style: TextStyle(color: Colors.white, fontSize: fontSize2),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buttondesign("AC", Colors.black,
//                   Color.fromRGBO(250, 244, 244, 0.6), w * 0.2),
//               buttondesign("C", Colors.black,
//                   Color.fromRGBO(250, 244, 244, 0.6), w * 0.2),
//               buttondesign("%", Colors.black,
//                   Color.fromRGBO(250, 244, 244, 0.6), w * 0.2),
//               buttondesign(
//                   "÷", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buttondesign("7", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("8", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("9", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign(
//                   "x", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buttondesign("4", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("5", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("6", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign(
//                   "-", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buttondesign("1", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("2", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign("3", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign(
//                   "+", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buttondesign("0", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.45),
//               buttondesign(".", Colors.white,
//                   Color.fromARGB(255, 48, 48, 48), w * 0.2),
//               buttondesign(
//                   "=", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buttondesign(String text, Color fontColor, Color _color, double w1) {
//     double h = MediaQuery.of(context).size.height,
//         w = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: () {
//         if (text == "AC") {
//           setState(() {
//             inputNum = "0";
//             answerNum = "0";
//             fontSize1 = 35;
//             fontSize2 = 45;
//           });
//         } else if (text == "C") {
//           setState(() {
//             inputNum = inputNum.substring(0, inputNum.length - 1);
//             fontSize1 = 35;
//             fontSize2 = 45;
//           });
//         } else if (text == "=") {
//           try {
//             setState(() {
//               expression1 = inputNum;
//               expression1 = expression1.replaceAll("x", "*");
//               expression1 = expression1.replaceAll("÷", "/");
//               Parser parser = Parser();
//               Expression expression2 = parser.parse(expression1);
//               ContextModel cont = ContextModel();
//               answerNum = "${expression2.evaluate(EvaluationType.REAL, cont)}";
//               fontSize1 = 35;
//               fontSize2 = 45;
//             });
//           } catch (e) {
//             setState(() {
//               answerNum = "Error";
//               fontSize1 = 35;
//               fontSize2 = 45;
//             });
//           }
//         } else {
//           //bu yerda teskari bo'lgani sababi tepadagi shartlarga 
//           //tushmasa tepasi qiymat yozganimizda 45 razmerda 
//           //keyin ishoralarni qo'yib teng bosganimizda esa 
//           //teskarisi bo'ladi yani kiratayotgan qator 35 razmerda
//           //javob chiqadigan qator 45 razmerda bo'ladi.
//           fontSize1 = 45;
//           fontSize2 = 35;
//           if (inputNum == "0") {
//             setState(() {
//               inputNum = text;
//             });
//           } else {
//             inputNum += text;
//             setState(() {});
//           }
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 15),
//         alignment: Alignment.center,
//         height: h * 0.09,
//         width: w1,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(150),
//           color: _color,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(color: fontColor, fontSize: 30),
//         ),
//       ),
//     );
//   }
// }

import 'package:calculatorapp1/view/button_page.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String userInput = "";
  String userAnswer = "";

  final List<String> buttonList = [
    'AC',
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "00",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 31, 31),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  //userInput field
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment(1.0, 1.0),
                    child: AutoSizeText(
                      userInput,
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                      
                      maxLines: 1,
                    ),
                  ),
                  //userAnswer field
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment(1.0, 1.0),
                    child: AutoSizeText(
                      userAnswer,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, index) {
                  //clear button
                  if (index == 0) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput = "";
                          userAnswer = "";
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.grey[400],
                      textColor: Colors.black,
                    );
                  } //delate button
                  else if (index == 1) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.grey[400],
                      textColor: Colors.black,
                    );
                  }
                  //persentage button
                  else if (index == 2) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.grey[400],
                      textColor: Colors.black,
                    );
                  }
                  //division button
                  else if (index == 3) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                    );
                  }
                  //multiplication button
                  else if (index == 7) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                    );
                  }
                  //minus button
                  else if (index == 11) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                    );
                  }
                  //plus button
                  else if (index == 15) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Colors.orange,
                      textColor: Colors.white,
                    );
                  }
                  //double zero button
                  else if (index == 16) {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Color.fromARGB(255, 84, 82, 82),
                      textColor: Colors.white,
                    );
                  }
                  //equal button
                  else if (index == 19) {
                    return MyButtons(
                        buttonTap: () {
                          setState(() {
                            tenglikBosilganda();
                          });
                        },
                        color: Colors.orange,
                        textColor: Colors.white,
                        buttomText: buttonList[index]);
                  }
                  //other number buttons
                  else {
                    return MyButtons(
                      buttonTap: () {
                        setState(() {
                          userInput += buttonList[index];
                        });
                      },
                      buttomText: buttonList[index],
                      color: Color.fromARGB(255, 84, 82, 82),
                      textColor: Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

//Mathematical functions
  void tenglikBosilganda() {
    String finalQuestions = userInput;
    finalQuestions = finalQuestions.replaceAll("x", "*");

    Parser p = Parser();
    Expression expr = p.parse(finalQuestions);
    ContextModel contextModel = ContextModel();
    double evaluate = expr.evaluate(EvaluationType.REAL, contextModel);

    userAnswer = evaluate.toString();
  }
}

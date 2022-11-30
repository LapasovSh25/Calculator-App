import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButtons extends StatelessWidget {
  final color;
  final textColor;
  final String buttomText;
  final buttonTap;

  const MyButtons(
      {super.key, this.color, this.textColor, required this.buttomText, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttomText,
                style: TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.w500 ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

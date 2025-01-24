import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {


  final String numberUsed;
  final int fillColor;
  final int textColor;
  final double textSize;
   Function callback;

  const Buttons({super.key,
    required this.numberUsed,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 75,
        height: 75,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(fillColor))
          ),
          onPressed: () => callback(numberUsed),
          child: Text(' $numberUsed ',
            style: TextStyle(
              color: Color(textColor),
              fontSize: textSize,)
            ,),

        ),
      ),
    );
  }
}
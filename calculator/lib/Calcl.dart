import 'package:flutter/material.dart';
import 'package:calculator/buttons.dart';
class CalculatorApp extends StatefulWidget{
  const CalculatorApp({super.key});
  @override
  _CalculatorAppState createState()=>_CalculatorAppState();
}

class _CalculatorAppState extends State <CalculatorApp>{
  int firstNum;
  int secondNum;
  String history;
  String textToDisplay;
  String res;
  String operation;

  _CalculatorAppState({
    required this.firstNum,
  required this.secondNum,
  required this.history,
  required this.textToDisplay,
  required this.res,
  required this.operation,
});

  void btnOnClick(String btnVal) {
    print(btnVal);
    if(btnVal=='C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    }
    else if(btnVal=='AC'){
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history='';

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title:const Text('Calculator',style: TextStyle(color: Color(0xF3F6F6F6),
    fontSize: 23)),
    backgroundColor: Color(0xF393393F),

    ),
    backgroundColor: Color(0xE862686C),
    body: Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Container(
    child: Padding(
    padding: EdgeInsets.only(right:12 ),
    child: Text('98X7',
    style: TextStyle(
    fontSize: 24,
    color: Colors.white38,
    ),
    ),
    ),
    alignment: Alignment(1, 1),
    ),
    Container(

    child:Padding(
    padding: EdgeInsets.all(12),
    child: Text('987',
    style: TextStyle(
    fontSize: 48,
    color: Colors.white38,
    ),),



    ),
    alignment: Alignment(1, 1),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Buttons(numberUsed: 'C',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback: btnOnClick,
    ),
    Buttons(numberUsed: '()',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '%',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '/',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),

    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Buttons(numberUsed: '7',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback: btnOnClick,
    ),
    Buttons(numberUsed: '8',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '9',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: 'X',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),

    ],
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Buttons(numberUsed: '4',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '5',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '6',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '-',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),

    ],
    ),Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Buttons(numberUsed: '1',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback: btnOnClick,
    ),
    Buttons(numberUsed: '2',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '3',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '+',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),

    ],
    ),Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Buttons(numberUsed: '+/-',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '0',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '.',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),
    Buttons(numberUsed: '=',
    fillColor:0xF393393F,
    textColor: 0xF393393F,
    textSize: 20,
    callback:  btnOnClick,
    ),

    ],
    )
    ],

    ),
    ));

  }


}
}
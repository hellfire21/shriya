import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';
import 'package:flutter_application_1/text_style.dart';

var startAlignment=Alignment.topLeft;
var endAlignment=Alignment.bottomRight;
class GradientContainer extends StatelessWidget{
  const  GradientContainer(this.color1,this.color2,{super.key});
  //constructor
  //initialization
final Color color1;
final Color color2;

  @override
  Widget build(context){
    return Container(
        decoration:  BoxDecoration(
          gradient:LinearGradient(
            colors:[color1,color2],
            begin:startAlignment,
            end:endAlignment,

          ),
        ),
        child:const Center(
          child:DiceRoller(),

    ),
    );
  }
}


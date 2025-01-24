import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
class QuizStart extends StatefulWidget{
  const QuizStart({super.key});
  @override
  State<QuizStart> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<QuizStart> {
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';
  void switchScreen(){
    setState((){
      activeScreen='question_screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
       setState(() {
         //selectedAnswers=[];
         activeScreen='results_screen';
       });
    }
  }



  @override
  Widget build(context){
    Widget screenWidget=StartScreen(switchScreen);

    if(activeScreen=='question_screen'){
      screenWidget= Question(
        onSelectAnswer:chooseAnswer,);
    }

    if(activeScreen=='results_screen'){
      screenWidget= ResultsScreen(chosenAnswers: selectedAnswers,);
    }
    return
      MaterialApp(
          home:Scaffold(
            body:Container(
              decoration:const BoxDecoration(
                gradient:LinearGradient(
                  colors:[
                    Colors.deepPurpleAccent,
                    Colors.deepPurple,
                  ],
                  begin:Alignment.topLeft,
                  end:Alignment.bottomLeft,
                ),
              ),
              child: screenWidget,
            ),
          )
      );
  }

}

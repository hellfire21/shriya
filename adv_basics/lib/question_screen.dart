import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class Question extends StatefulWidget{
  const Question({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<Question> createState(){
      return _QuestionState();
  }
}

class _QuestionState extends State<Question>{
  var currentQuestionIndex=0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex=currentQuestionIndex+1;
    });

  }
  @override
  Widget build(context){
    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width:double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
            style: GoogleFonts.lato(
              color:Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign:TextAlign.center,),
            const SizedBox(height:30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
            })

          ],
        ),
      ),
    );
  }
}
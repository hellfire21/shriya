import 'package:flutter/material.dart';

import'package:flutter_application_1/gradient_container.dart';
void main() {
  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.redAccent,
        body:  GradientContainer(Colors.cyan,Colors.greenAccent),
      ),
    ),
  );
}



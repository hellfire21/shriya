import 'package:deliver_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:deliver_app/components/my_button.dart';

class LoginPage extends StatelessWidget {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            //message,app slogon
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //email textfield
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(height: 25),

            //password textfield
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 25),

            //sign in button
           MyButton(
             text:"Sign In",
             onTap:(){},
           ),

            const SizedBox(height: 25),

            //not a member?register now
            Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
                Text("Not a member?",style:TextStyle(color:Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width:6),

                GestureDetector(
                  child: Text("Register Now",
                      style:TextStyle(
                          color:Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,)),
                ),
              ],
            )
          ]),
        ));
  }
}

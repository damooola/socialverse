import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';

import '../helper/helper_functions.dart';

class SignInPage extends StatefulWidget {
  final void Function()? goToSignUpPage;
  const SignInPage({super.key, required this.goToSignUpPage});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // textfeild controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sign in user
  void userSignIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    // try sign in user
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        Navigator.pop(context);
        showErrorMessage("${e.message}", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.person_2_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 25),
          //app name
          const Text(
            "SOCIALVERSE",
            style: TextStyle(letterSpacing: 2, fontSize: 20),
          ),
          const SizedBox(height: 25),
          //email textfeild
          MyTextField(
              hintText: "Type Email",
              obscureText: false,
              controller: emailController),
          const SizedBox(height: 15),
          //pw textfield
          MyTextField(
              hintText: "Type Password",
              obscureText: true,
              controller: passwordController),
          const SizedBox(height: 10),

          // forgot password?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),

          // sign in button
          MyButton(text: "Sign In", onTap: userSignIn),

          const SizedBox(height: 30),

          //dont have an account, register here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
              TextButton(
                  onPressed: widget.goToSignUpPage,
                  child: const Text(
                    "Sign Up Here!",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

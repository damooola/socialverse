import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../helper/helper_functions.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? goToSignInPage;
  const SignUpPage({super.key, required this.goToSignInPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // textfeild controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sign in user
  userSignUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    // confirm passwords match
    if (passwordController.text != confirmPasswordController.text) {
      // pop the loeading circle
      Navigator.pop(context);
      // show error to user
      showErrorMessage("Passwords Don't Match!", context);
    } else {
      // try creating new user
      try {
        UserCredential? userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
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
          // username
          MyTextField(
              hintText: "Type Username",
              obscureText: false,
              controller: userNameController),
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
          const SizedBox(height: 15),

          //confirm password textfield
          MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confirmPasswordController),
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
          MyButton(text: "Sign Up", onTap: userSignUp),

          const SizedBox(height: 30),

          //dont have an account, register here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
              TextButton(
                  onPressed: widget.goToSignInPage,
                  child: const Text(
                    "Sign In Here!",
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

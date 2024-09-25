import 'package:flutter/material.dart';
import 'package:social_media_app/pages/sign_in_page.dart';
import 'package:social_media_app/pages/sign_up_page.dart';

class SigninOrSignupPage extends StatefulWidget {
  const SigninOrSignupPage({super.key});

  @override
  State<SigninOrSignupPage> createState() => _SigninOrSignupPageState();
}

class _SigninOrSignupPageState extends State<SigninOrSignupPage> {
  // show signIn page at first
  bool onSignInPage = true;

// change page when user taps
  void togglePage() {
    setState(() {
      onSignInPage = !onSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (onSignInPage) {
      return SignInPage(
        goToSignUpPage: togglePage,
      );
    } else {
      return SignUpPage(
        goToSignInPage: togglePage,
      );
    }
  }
}

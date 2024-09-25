import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/auth_gate.dart';
import 'package:social_media_app/auth/signin_or_signup_page.dart';
import 'package:social_media_app/firebase_options.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/pages/users_page.dart';
import 'package:social_media_app/theme/dark_mode.dart';
import 'package:social_media_app/theme/light_mode.dart';
import 'package:social_media_app/theme/theme_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // initialise firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


// add provider to app
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthGate(),
      routes: {
        "/signin_signup_page": (context) => const SigninOrSignupPage(),
        "/home_page": (context) => const HomePage(),
        "/profile_page": (context) => const ProfilePage(),
        "/users_page": (context) => const UsersPage(),
      },
    );
  }
}

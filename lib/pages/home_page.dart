import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_app_bar.dart';
import 'package:social_media_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      drawer: MyDrawer(
        currentUserName: FirebaseAuth.instance.currentUser!.email!.substring(
            0, FirebaseAuth.instance.currentUser!.email!.length - 10),
      ),
    );
  }
}

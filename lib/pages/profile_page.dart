import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_app_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

// current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  //fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const MyAppBar(title: "Profile Page"),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: fetchUserDetails(),
        builder: (context, snapshot) {
          // loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error handling
          else if (snapshot.hasError) {
            return const Center(
              child: Text("Error.."),
            );
          }

          // if avalable data exists
          else if (snapshot.hasData) {
            // get data
            Map<String, dynamic>? userData = snapshot.data!.data();

            return Center(
              child: Column(
                children: [
                  Text(userData!["email"]),
                  Text(userData["username"])
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

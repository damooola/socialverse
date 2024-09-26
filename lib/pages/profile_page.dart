import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_back_button.dart';

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
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 50),
                    child: Row(
                      children: [
                        MyBackButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // profile picture
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).colorScheme.primary),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 60,
                    ),
                  ),
                  const SizedBox(height: 25),
                  //username
                  Text(
                    userData!["username"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  //user email
                  Text(
                    userData["email"],
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
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

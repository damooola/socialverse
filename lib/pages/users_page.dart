import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/helper/helper_functions.dart';
import '../components/my_back_button.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});
  // current useer
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Stream<List<Map<String, dynamic>>> fetchUsersStream() {
    return FirebaseFirestore.instance.collection("Users").snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            final user = doc.data();
            return user;
          },
        ).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
          stream: fetchUsersStream(),
          builder: (context, snapshot) {
            // loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // error handling
            else if (snapshot.hasError) {
              return showErrorMessage("Something is wrong", context);
            } else if (!snapshot.hasData) {
              return showErrorMessage("No Users", context);
            }

            final userList = snapshot.data!;
            return Column(
              children: [
                // back button
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 50),
                  child: Row(
                    children: [
                      MyBackButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // list of users
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic> user = userList[index];
                      // if (user["email"] != currentUser!.email) {
                      return ListTile(
                        leading: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary),
                            child: const Icon(Icons.person)),
                        title: Text(
                          user["username"],
                        ),
                        subtitle: Text(user["email"]),
                      );
                      // }
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_drawer.dart';
import 'package:social_media_app/components/my_textfield.dart';
import 'package:social_media_app/database/firestore.dart';
import '../components/my_post_button.dart';
import '../components/user_post_item.dart';
import '../helper/helper_functions.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //user post textfield controller
  final TextEditingController userPostController = TextEditingController();
  // firestoredatabase object
  final FirestoreDataBase firestoreDataBase = FirestoreDataBase();

  // send new post only is textfeild is not empty
  sendPost(String userText) {
    if (userPostController.text.isNotEmpty) {
      firestoreDataBase.sendPost(userText);
    }
    userPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: const Icon(
            Icons.chat_bubble_outline,
            size: 50,
          )),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            // posts
            Expanded(child: buildUserPosts()),
            //user texfield
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                        hintText: "What's on your mind?",
                        obscureText: false,
                        controller: userPostController),
                  ),

                  // post button
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: MyPostButton(
                      onPressed: () => sendPost(userPostController.text),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserPosts() {
    return StreamBuilder(
      stream: firestoreDataBase.getUserPosts(),
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
        }
        // if no posts yet
        else if (!snapshot.hasData) {
          return const Center(child: Text("No posts yet 🥲"));
        } // and if there are posts
        else if (snapshot.hasData) {
          final posts = snapshot.data!.docs;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot doc = posts[index];
              return UserPostItem(doc: doc);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

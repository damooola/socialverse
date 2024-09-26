import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserPostItem extends StatelessWidget {
  final DocumentSnapshot<Object?> doc;
  const UserPostItem({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final userPost = doc.data() as Map<String, dynamic>;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.primary),
      child: ListTile(
        // leading: Container(
        //     padding: const EdgeInsets.all(5),
        //     decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Theme.of(context).colorScheme.primary)),
        title: Text(
          userPost["userPost"],
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        subtitle: Text(
          userPost["userEmail"],
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}

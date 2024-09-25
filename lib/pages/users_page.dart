import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_app_bar.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Users Page"),
    );
  }
}

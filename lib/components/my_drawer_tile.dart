import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function()? onTap;
  const MyDrawerTile(
      {super.key,
      required this.text,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              letterSpacing: 5),
        ),
        leading: Icon(
          iconData,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}

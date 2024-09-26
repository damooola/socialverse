import 'package:flutter/material.dart';

class MyPostButton extends StatelessWidget {
  final void Function()? onPressed;
  const MyPostButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).colorScheme.inversePrimary),
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.send_rounded,
              size: 35, color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }
}

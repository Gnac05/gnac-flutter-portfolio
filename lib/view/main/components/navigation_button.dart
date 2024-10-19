import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final int index;
  final int currentIndex;

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text, required this.index, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold, color: currentIndex == index? Colors.pink : Colors.white),
        ));
  }
}

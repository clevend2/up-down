import 'package:flutter/material.dart';

class NavigationUtilities {
  static void fadePush(BuildContext context, Widget Function() transitionTo) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => transitionTo(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}

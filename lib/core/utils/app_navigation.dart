import 'package:flutter/material.dart';

class AppNavigation {
  static push({required BuildContext context, required Widget view}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }

  static pushReplacement(
      {required BuildContext context, required Widget view}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }

  static pushAndRemove({required BuildContext context, required Widget view}) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return view;
      },
    ), (route) => false);
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static pushWithSlidingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Duration transitionDuratio = const Duration(milliseconds: 300),
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        reverseTransitionDuration: reverseTransitionDuration,
        transitionDuration: transitionDuratio,
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static pushWithFadingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Duration transitionDuratio = const Duration(milliseconds: 300),
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        reverseTransitionDuration: reverseTransitionDuration,
        transitionDuration: transitionDuratio,
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
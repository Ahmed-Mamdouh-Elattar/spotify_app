import 'package:flutter/material.dart';

class AppNavigation {
  static void push({required BuildContext context, required Widget view}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return view;
        },
      ),
    );
  }

  static void pushReplacement(
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

  static void pushAndRemoveAll(
      {required BuildContext context, required Widget view}) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return view;
      },
    ), (route) => false);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushWithSlidingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 200),
    Duration transitionDuratio = const Duration(milliseconds: 200),
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

  static void pushReplacementWithSlidingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 200),
    Duration transitionDuratio = const Duration(milliseconds: 200),
  }) {
    Navigator.pushReplacement(
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

  static void pushAndRemoveAllWithSlidingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 200),
    Duration transitionDuratio = const Duration(milliseconds: 200),
  }) {
    Navigator.pushAndRemoveUntil(
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
      (route) => false,
    );
  }

  static void pushWithFadingAnimation({
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

  static void pushReplacementWithFadingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Duration transitionDuratio = const Duration(milliseconds: 300),
  }) {
    Navigator.pushReplacement(
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

  static void pushAndRemoveAllWithFadingAnimation({
    required BuildContext context,
    required Widget view,
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    Duration transitionDuratio = const Duration(milliseconds: 300),
  }) {
    Navigator.pushAndRemoveUntil(
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
      (route) => false,
    );
  }
}

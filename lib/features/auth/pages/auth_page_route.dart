import 'package:flutter/material.dart';

class AuthPageRoute<T> extends PageRouteBuilder<T> {
  AuthPageRoute({required Widget child, bool withAnimation = true})
    : super(
        opaque: false,
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        transitionDuration: withAnimation
            ? const Duration(milliseconds: 350)
            : Duration.zero,
        reverseTransitionDuration: withAnimation
            ? const Duration(milliseconds: 300)
            : Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          if (!withAnimation) {
            return child;
          }
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          );
        },
      );
}

import 'package:flutter/material.dart';

class ScreenNavigationSlide extends PageRouteBuilder {
  final Widget page;

  ScreenNavigationSlide({required this.page})
      : super(
    // transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return

        // ScaleTransition(scale: animation,child: child);
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
    },
  );
}

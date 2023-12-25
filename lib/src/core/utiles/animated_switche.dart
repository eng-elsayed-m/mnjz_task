import 'package:flutter/material.dart';

class AnimatedSwitch extends StatelessWidget {
  final Widget child;
  final bool isFadeTransition;
  final int duration;
  const AnimatedSwitch(
      {super.key,
      required this.child,
      this.isFadeTransition = false,
      this.duration = 300});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      reverseDuration: Duration(milliseconds: isFadeTransition ? 650 : 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final positionAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation);
        return isFadeTransition
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : SlideTransition(
                position: positionAnimation,
                child: child,
              );
      },
      child: child,
    );
  }
}

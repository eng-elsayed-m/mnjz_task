import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

const _defaultTransition = PageTransitionType.bottomToTop;
const _alignment = Alignment.center;
const _duration = Duration(milliseconds: 400);

class NV {
  static void nextScreen(context, page) {
    Navigator.push(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition));
  }

  static void nextScreenOS(context, page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  static void nextScreenCloseOthers(context, page) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition),
        (route) => false);
  }

  static void nextScreenReplace(context, page) {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: page,
            duration: _duration,
            alignment: _alignment,
            type: _defaultTransition));
  }

  // Named

  static void nextScreenNamed(context, routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void nextScreenOSNamed(context, routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void nextScreenCloseOthersNamed(context, routeName) {
    Navigator.restorablePushNamedAndRemoveUntil(
        context, routeName, (route) => false);
  }

  static void nextScreenReplaceNamed(context, routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void nextScreenPopup(context, page) {
    Navigator.push(
      context,
      PageTransition(
          child: page,
          duration: _duration,
          alignment: _alignment,
          type: _defaultTransition,
          fullscreenDialog: true),
    );
  }
}

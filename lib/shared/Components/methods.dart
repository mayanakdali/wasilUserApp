import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

Future<dynamic> goTo({required BuildContext context, required Widget screen}) {
  return Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeftWithFade, child: screen));
}

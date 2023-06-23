import 'package:flutter/cupertino.dart';

Widget logoOpeningPage(BuildContext context, Animation<double> controller) {
  return RotationTransition(
      turns: controller, child: Image.asset("assets/images/main-img.png"));
}

Widget logoRemainingPage(BuildContext context, Animation<double> controller) {
  return RotationTransition(
      turns: controller,
      child: Image.asset(
        "assets/images/main-img.png",
        height: 200,
        width: 200,
      ));
}

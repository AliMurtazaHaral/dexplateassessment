import 'dart:async';

import 'package:dexplateassessment/app.dart';
import 'package:dexplateassessment/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/logo.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.repeat();
    Timer(Duration(seconds: 2),
            () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WelcomeView()))
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
        color: Colors.white, child: logoOpeningPage(context, controller));
  }
}



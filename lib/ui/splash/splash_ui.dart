import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getx_boilerplate/ui/components/components.dart';
import 'package:getx_boilerplate/constants/constants.dart';
import 'package:getx_boilerplate/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/ui/ui.dart';

class SplashUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  final AuthController authController = AuthController.to;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(child: AppIconWidget(image: Assets.appLogo)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    //authController.currentUserStore();
    Get.off(HomeUI());
  }
}
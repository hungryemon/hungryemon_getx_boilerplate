import 'package:flutter/material.dart';
import 'package:getx_boilerplate/controllers/controllers.dart';

class HomeUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final AuthController authController = AuthController.to;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(child: Text('Home'),),
    );
  }

}
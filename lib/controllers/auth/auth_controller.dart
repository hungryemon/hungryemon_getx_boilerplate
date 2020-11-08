import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_boilerplate/utils/localizations.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  AppLocalizations_Labels labels;
  bool isLoggedIn = false;
  final store = GetStorage();

  //Gets the user if already Logged In
  currentUserStore() async{
    isLoggedIn = store.read('isLoggedIn') ?? false;

    //Get user login info and redirect to home here
    if(isLoggedIn) {

    }

  }

  //Authenticate user here
  authUser() {

  }

  //Sign Out
  signOut() {

  }

}
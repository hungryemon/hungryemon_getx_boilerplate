import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui' as ui;
import 'package:getx_boilerplate/constants/constants.dart';
import 'package:getx_boilerplate/utils/localizations.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final language = "".obs;
  final store = GetStorage();

  String get currentLanguage => language.value;

  @override
  void onReady() async {
    setInitialLocalLanguage();
    super.onInit();
  }

  //Gets current language stored
  RxString get currentLanguageStore {
    language.value = store.read('language');
    return language;
  }

  //Updates the stored Language
  Future<void> updateLanguage(String value) async {
    language.value = value;
    await store.write(('language'), value);
    Get.updateLocale(getLocale);
    update();
  }

  //Get the language locale app is set to
  Locale get getLocale {
    if((currentLanguageStore.value == '') ||
        (currentLanguageStore.value == null)) {
      language.value = Globals.defaultLanguage;
      updateLanguage(Globals.defaultLanguage);
    }
    //Gets the Default Language Key (from the translation language system)
    Locale _updatedLocale = AppLocalizations.languages.keys.first;
    //Looks for matching language key stored and sets to it
    AppLocalizations.languages.keys.forEach((locale) {
      if (locale.languageCode == currentLanguage) {
        _updatedLocale = locale;
      }
    });

    return _updatedLocale;
  }

  //Retrieves and Sets language based on device settings
  setInitialLocalLanguage() {
    if((currentLanguageStore.value == '') ||
        (currentLanguageStore.value == null)) {
      String _deviceLanguage = ui.window.locale.toString();
      _deviceLanguage = _deviceLanguage.substring(0,2);
      print(ui.window.locale.toString());
      updateLanguage(_deviceLanguage);
    }
  }

}
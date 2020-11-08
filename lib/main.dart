import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/constants/app_themes.dart';
import 'package:getx_boilerplate/constants/constants.dart';
import 'package:getx_boilerplate/controllers/controllers.dart';
import 'package:getx_boilerplate/ui/components/components.dart';
import 'package:getx_boilerplate/utils/localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  Get.put<LanguageController>(LanguageController());
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
        builder: (languageController) => Loading(
          child: GetMaterialApp(
            //begin translation
            locale: languageController.getLocale,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ],
            supportedLocales: AppLocalizations.languages.keys.toList(),
            //end translation
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.system,
            initialRoute: "/",
            getPages: AppRoutes.routes,
          ),
        )
    );
  }
}
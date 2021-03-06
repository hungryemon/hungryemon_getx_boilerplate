import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'localizations.g.dart';
//to rebuild language files
//delete the localizations.g.dart file
//on command line run...
//flutter packages pub run build_runner build

@SheetLocalization("1a7icz0fkIaYwhBfOjwGIsfo1zj14XPbTzKa7fZbdniM", "0")

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.containsKey(locale);
  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

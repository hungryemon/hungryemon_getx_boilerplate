
import 'package:getx_boilerplate/models/models.dart';

class Globals {
  static final String defaultLanguage = 'en';
//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1a7icz0fkIaYwhBfOjwGIsfo1zj14XPbTzKa7fZbdniM/edit?usp=sharing

  static final List<LanguageOptionsModel> languageOptions = [
    LanguageOptionsModel(key: "de", value: "Deutsche"), //German
    LanguageOptionsModel(key: "en", value: "English"), //English
    LanguageOptionsModel(key: "es", value: "Español"), //Spanish
    LanguageOptionsModel(key: "hi", value: "हिन्दी"), //Hindi
    LanguageOptionsModel(key: "pt", value: "Português"), //Portuguese
    LanguageOptionsModel(key: "ru", value: "русский"), //Russian
    LanguageOptionsModel(key: "bn", value: "বাংলা"), //Bengali
  ];
}
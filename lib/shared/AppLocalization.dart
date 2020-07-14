
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class AppLocalization{
  Locale locale;
  Map<String,String> _filecontent;


  AppLocalization(this.locale);

   static AppLocalization of(BuildContext context){
     return Localizations.of<AppLocalization>(context,AppLocalization);
   }
  Future<void> load() async{
    print(locale.languageCode);

    String jsonString = await rootBundle.loadString('assets/${locale.languageCode}.json');
    Map<String ,dynamic> content = json.decode(jsonString);
    _filecontent = content.map((key, value) { return MapEntry(key ,value.toString()); }   );

  }

  String trenslate(String  key){
   return _filecontent[key];
  }
    
    static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();
}


class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
 
  const _AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
  
  return ['en','fr','ar'].contains(locale.languageCode);

  }

  @override
  Future<AppLocalization> load(Locale locale)async {

    AppLocalization localization = AppLocalization(locale);
   await localization.load();
   return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return false;
  }

}
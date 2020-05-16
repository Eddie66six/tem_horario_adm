import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class CustomLocalizations {  
  CustomLocalizations(this.locale);  
  
  final Locale locale;  
  
  static CustomLocalizations of(BuildContext context) {  
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);  
  } 
  
  Map<String, String> _sentences;  
  
  Future<bool> load(Locale newLocale) async {
    var nameFile = newLocale != null ? '${newLocale.languageCode}-${newLocale.countryCode}' :
      '${this.locale.languageCode}-${this.locale.countryCode}';
    print("Load " + nameFile);
    String data;
    try {
     data = await rootBundle.loadString('lib/resources/lang/'+nameFile+'.json'); 
    } catch (_) {
      data = await rootBundle.loadString('lib/resources/lang/pt-BR.json');
    }

    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }
  
  String translate(String key) {  
    var result = this._sentences[key];
    if(result == null) return key;
    return result;
  }  
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {  
  const CustomLocalizationsDelegate();  
  
  @override  
  bool isSupported(Locale locale) => ['tr', 'en', 'pt'].contains(locale.languageCode);  
  
  @override  
  Future<CustomLocalizations> load(Locale locale) async {  
    CustomLocalizations localizations = CustomLocalizations(locale);  
  await localizations.load(null);  
  
  print("Load ${locale.languageCode}");  
  
  return localizations;  
  }  
  
  @override  
  bool shouldReload(CustomLocalizationsDelegate old) => true;  
}
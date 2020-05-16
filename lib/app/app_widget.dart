import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tem_horario_adm/app/modules/internal_modules/menuPage.dart';
import 'package:tem_horario_adm/app/modules/login/login_module.dart';
import 'package:tem_horario_adm/app/services/localstorage_service.dart';
import 'package:tem_horario_adm/localization.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tem horario adm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<dynamic>(
        future: LocalstorageService.to.getUserData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return snapshot.data == null ? LoginModule() : MenuPage();
          }
          return Scaffold(body: Center(child: Text("Carregando")));
        },
      ),
      supportedLocales: [  
        const Locale('pt', 'BR'),
        const Locale('tr', 'TR'),  
        const Locale('en', 'US')  
      ],
      localizationsDelegates: [  
        const CustomLocalizationsDelegate(),  
        GlobalMaterialLocalizations.delegate,  
        GlobalWidgetsLocalizations.delegate
      ],  
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {  
        for (Locale supportedLocale in supportedLocales) {  
          if (supportedLocale.languageCode == locale.languageCode || supportedLocale.countryCode == locale.countryCode) {  
            return supportedLocale;  
          }   
        }
        return supportedLocales.first;  
      },
    );
  }
}

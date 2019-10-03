import 'package:componentes_curso/src/pages/alert_page.dart';
import 'package:componentes_curso/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // spanish
      ],

      debugShowCheckedModeBanner: false,
     // home: HomePage(),
     initialRoute: '/',
     routes: getApplicationRoutes(),
     onGenerateRoute: (settings) {
       return MaterialPageRoute(
         builder: (BuildContext context) => AlertPage()
       );
     },
    );
    
  }
}
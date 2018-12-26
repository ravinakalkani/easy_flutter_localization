import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'delegate.dart';
import 'demo_localization.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: [const Locale('gu', 'GU'), const Locale('en', 'US')],
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(DemoLocalizations.of(context).trans("hello_world")),
        ),
        body: Container(
          child: Center(
            child: Text(
              DemoLocalizations.of(context).trans("world"),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
      ),
    );
  }
}

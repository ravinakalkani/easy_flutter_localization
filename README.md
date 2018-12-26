# flutter localization

A new Flutter application.

## Getting Started

This project is a for Flutter localization.


- Add this code in pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: //new
    sdk: flutter //new
    
- Create delegate file and localization file //copy from this code.

- Add this code to main.dart file in build overrided method.

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
 
 - Create directory resources/lang and create json files for strings. // check the code.
 
 - write code to puspes.yaml like below
 
 flutter:
  uses-material-design: true
  assets: //new
    - resources/lang/gu.json //new 
    - resources/lang/en.json //new
 
 
 
 
 
 

import 'package:flutter/material.dart';
import 'informed_consent_page.dart';
import 'linear_survey_page.dart';
import 'navigable_survey_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:research_package/research_package.dart';
import 'app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('da'),
      ],
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        RPLocalizations.delegate,
        // Built-in localization of basic text for Cupertino widgets
        GlobalCupertinoLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode
              /*  && supportedLocale.countryCode == locale.countryCode */
              // TODO: Test on physical iPhone if Locale should use countryCode instead
              ) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
        primarySwatch: velmioColor,
        scaffoldBackgroundColor: Color(0xffF6F7F8),
        iconTheme: IconThemeData(color: velmioColor),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Quicksand',
            color: Color(0xff414141),
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            fontFamily: 'Quicksand',
            color: Color(0xff414141),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            fontFamily: "Open Sans",
            fontSize: 14,
            color: Color(0xff7f7f7f),
          ),
        ),
      ),
      title: 'Research Package Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Research Package Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                child: Text(
                  "With Research Package you can obtain informed consent, create surveys and collect their results",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Informed Consent",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformedConsentPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Survey (Linear)",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LinearSurveyPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Survey (Branching)",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavigableSurveyPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Image.asset(
          "assets/images/cachet.png",
          height: 40,
        ),
      )),
    );
  }
}

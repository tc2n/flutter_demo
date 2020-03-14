import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_demo/screens/home_screen.dart';
import 'package:flutter_demo/models/dark_theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(create: (context)=>DarkData(),
    child: MyApp(),
    )
    );
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Chat',
        debugShowCheckedModeBanner: false,
        //options used in ThemeData are just a workaround to make DarkMode work, Please ignore these
        theme: ThemeData(
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    cardColor: kCardColor,
    textSelectionColor: kTextColor1,
    cursorColor: kTextColor2,
    secondaryHeaderColor: kGradientRed,
    focusColor: kMessageText
        ),
        darkTheme: ThemeData(
    primaryColor: kPrimaryColordark,
    accentColor: kAccentColordark,
    cardColor: kCardColordark,
    textSelectionColor: kTextColor1dark,
    cursorColor: kTextColor2dark,
    secondaryHeaderColor: kGradientRedDark,
    focusColor: kMessageTextdark
        ),
        themeMode: Provider.of<DarkData>(context).isDark ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(),
      );
  }
}
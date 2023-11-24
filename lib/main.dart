import 'package:contact_app/Utils/Global.dart';
import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:contact_app/Views/HomeView/View/First.dart';
import 'package:contact_app/Views/SplashView/View/INTRO_.dart';
import 'package:contact_app/Views/Formview/view/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/SplashView/View/Introduction_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Global.AppLightTheme,
        darkTheme: Global.AppDarkTheme,
        themeMode: (Provider.of<ThemeProvider>(context).m.isDark == true)
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          "/": (context) => const Inttro_Screen(),
          "Main": (context) => const MainPage_(),
          "Create_": (context) => const Contacts_(),
        },
      ),
    ),
  );
}

import 'package:contact_app/Utils/Global.dart';
import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:contact_app/Views/HomeView/View/First.dart';
import 'package:contact_app/Views/SplashView/View/View/INTRO_.dart';
import 'package:contact_app/Views/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: (Provider.of<ThemeProvider>(context).m.isDark == true)
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          "/": (context) => const Intro_(),
          "Main": (context) => const MainPage_(),
          "Create_": (context) => const Contacts_(),
        },
      ),
    ),
  );
}

import 'package:contact_app/Utils/Global.dart';
import 'package:contact_app/Views/Formview/provider/FormProvider.dart';
import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:contact_app/Views/HomeView/View/First.dart';
import 'package:contact_app/Views/Formview/view/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/SplashView/View/Introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isVisited = preferences.getBool('isVisited') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<FormProivder>(
          create: (context) => FormProivder(),
        ),
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
        initialRoute: (isVisited) ? 'Main' : '/',
        routes: {
          "/": (context) => const Introduction_Screen(),
          "Main": (context) => const MainPage_(),
          "Create_": (context) => const Contacts_(),
        },
      ),
    ),
  );
}

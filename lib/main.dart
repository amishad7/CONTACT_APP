import 'package:contact_app/Views/First.dart';
import 'package:contact_app/Views/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      routes: {
        "/": (context) => const MainPage_(),
        "Create_": (context) => const Contacts_(),
      },
    ),
  );
}

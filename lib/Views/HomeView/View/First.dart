import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage_ extends StatefulWidget {
  const MainPage_({super.key});

  @override
  State<MainPage_> createState() => _MainPage_State();
}

class _MainPage_State extends State<MainPage_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).Theme();
            },
            icon: Icon(
              (Provider.of<ThemeProvider>(context).m.isDark == false)
                  ? Icons.dark_mode
                  : Icons.sunny,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "Create_");
        },
        icon: const Icon(CupertinoIcons.add),
        label: const Text(
          "Add",
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
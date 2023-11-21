import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage_ extends StatefulWidget {
  const MainPage_({super.key});

  @override
  State<MainPage_> createState() => _MainPage_State();
}

class _MainPage_State extends State<MainPage_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
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

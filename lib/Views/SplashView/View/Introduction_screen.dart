import 'package:contact_app/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction_Screen extends StatelessWidget {
  const Introduction_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Connect Hub",
              body: "Catalog Your Contacts",
              image: Center(
                child: Image.asset("lib/assets/imges/first.jpeg"),
              ),
              decoration: PageDecoration(
                titleTextStyle: Global.Intro_title,
                bodyTextStyle: Global.Intro_bodytitle,
              ),
            ),
            PageViewModel(
              title: "Connect Memo",
              body: "Your Personalized Contact Diary",
              image: Center(
                child: Image.asset("lib/assets/imges/second.jpeg"),
              ),
              decoration: PageDecoration(
                titleTextStyle: Global.Intro_title,
                bodyTextStyle: Global.Intro_bodytitle,
              ),
            ),
            PageViewModel(
              title: "Connect Log",
              body: "Your Digital Contact Journal",
              image: Center(
                child: Image.asset("lib/assets/imges/third.jpeg"),
              ),
              decoration: PageDecoration(
                titleTextStyle: Global.Intro_title,
                bodyTextStyle: Global.Intro_bodytitle,
              ),
            ),
            PageViewModel(
              title: "Diary Connect",
              body: "Your Personalized Contact Companion",
              image: Center(
                child: Image.asset("lib/assets/imges/fourth.jpeg"),
              ),
              decoration: PageDecoration(
                titleTextStyle: Global.Intro_title,
                bodyTextStyle: Global.Intro_bodytitle,
              ),
            ),
          ],
          showBackButton: true,
          showNextButton: true,
          next: const Text("Next"),
          back: const Icon(Icons.arrow_back),
          done: const Text("Done"),
          onDone: () async {
            // On button pressed
            Navigator.pushReplacementNamed(context, 'Main');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();

            preferences.setBool('isDark', true);
            preferences.setBool('isVisited', true);
          },
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro_ extends StatefulWidget {
  const Intro_({super.key});

  @override
  State<Intro_> createState() => _Intro_State();
}

class _Intro_State extends State<Intro_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contact Diary ",
            style: GoogleFonts.capriola(
              color: Colors.green.shade400,
              fontSize: 50,
              letterSpacing: -3,
            ),
          ),
          Text(
            "App",
            style: GoogleFonts.capriola(
              color: Colors.green.shade400,
              fontSize: 50,
              letterSpacing: -3,
            ),
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CarouselSlider(
              items: [
                Container(
                  height: 30,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.greenAccent,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://i.pinimg.com/564x/d1/f0/b8/d1f0b8f919ced3799afd41ebc4a4bb5d.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.greenAccent,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://i.pinimg.com/736x/f5/94/9c/f5949c6ec2ce370ed1e3000455549bb8.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.greenAccent,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://i.pinimg.com/564x/c0/fa/5b/c0fa5b9988af522c5a747bd07fc488fc.jpg",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 290,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.greenAccent,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://i.pinimg.com/564x/ac/e9/58/ace958287d032488b88ec6cfd67e6c93.jpg",
                      ),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                scrollPhysics: BouncingScrollPhysics(),
              ),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "Main");
            },
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green.shade200,
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 24,
                    offset: Offset(4, 0),
                  ),
                ],
              ),
              child: Text(
                "Next >",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

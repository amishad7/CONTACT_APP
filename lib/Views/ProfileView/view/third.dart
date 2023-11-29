import 'package:contact_app/Views/ProfileView/Provider/FavDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Formview/Model/ContactDataModel.dart';
import '../../HomeView/Provider/ThemeProvider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ContactDataModel data =
        ModalRoute.of(context)!.settings.arguments as ContactDataModel;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).Theme();
            },
            icon: Icon(
              (Provider.of<ThemeProvider>(context).m.isDark == false)
                  ? Icons.dark_mode
                  : Icons.sunny,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.green),
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/8e/93/c7/8e93c72683f6926a7c97ae3f39cb90ec.jpg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SelectableText(
              '${data.titleName} ${data.subTitleName} ',
              style: GoogleFonts.poppins(
                fontSize: 45,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  child: Container(
                    width: 120,
                    child: IconButton(
                      onPressed: () {
                        Share.share(
                          '${data.titleName} ${data.subTitleName} ${data.mobileNumber}',
                        );
                      },
                      icon: const Icon(Icons.ios_share_rounded),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 120,
                    child: IconButton(
                      onPressed: () {
                        Provider.of<FavDataProvider>(context, listen: false)
                            .addInFav();
                      },
                      icon: Icon(
                        (Provider.of<FavDataProvider>(context, listen: true)
                                .f
                                .isFavourite)
                            ? Icons.star
                            : Icons.star_border_sharp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width / 1.1,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: '${data.mobileNumber} ',
                          ),
                        );
                      },
                      onTap: () {
                        launchUrl(
                          Uri(
                            scheme: 'tel',
                            path: '${data.mobileNumber}',
                          ),
                        );
                      },
                      title: Text(
                        "${data.mobileNumber}",
                      ),
                      leading: const Icon(
                        Icons.call,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      onTap: () {
                        launchUrl(
                          Uri(
                            scheme: 'sms',
                            path: '${data.mobileNumber}',
                          ),
                        );
                      },
                      title: const Text(
                        "Text message",
                      ),
                      leading: const Icon(
                        Icons.messenger,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: '${data.email}',
                          ),
                        );
                      },
                      onTap: () {
                        launchUrl(
                          Uri(
                            scheme: 'mailto',
                            path: '${data.email}',
                          ),
                        );
                      },
                      title: Text(
                        "${data.email}",
                      ),
                      leading: const Icon(
                        Icons.mail,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

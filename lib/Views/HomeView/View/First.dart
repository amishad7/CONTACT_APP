import 'dart:developer';

import 'package:contact_app/Views/Formview/provider/ContactDataModelProivder.dart';
import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Formview/Model/ContactDataModel.dart';

class MainPage_ extends StatelessWidget {
  MainPage_({super.key});

  LocalAuthentication authentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    List<ContactDataModel> ContactData =
        Provider.of<ContactDataProvider>(context).allContacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Contacts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
        icon: const Icon(
          CupertinoIcons.add,
        ),
        label: const Text(
          "Add",
          style: TextStyle(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Divider(),
            (ContactData.isEmpty)
                ? Center(
                    child: Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif"),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: Provider.of<ContactDataProvider>(context)
                        .allContacts
                        .length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) => Container(
                      child: Card(
                        child: Container(
                          height: 110,
                          alignment: Alignment.center,
                          child: ListTile(
                            onLongPress: () {
                              log('tap');
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    child: Text("delete"),
                                  ),
                                ],
                              );
                            },
                            onTap: () {
                              Navigator.pushNamed(context, 'subPage',
                                  arguments: ContactData[i]);
                            },
                            leading: Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width / 7,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            subtitle: Text(
                              ContactData[i].mobileNumber,
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri(
                                    scheme: 'tel',
                                    path: ContactData[i].mobileNumber,
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                              ),
                            ),
                            title: Text(
                              ContactData[i].titleName,
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

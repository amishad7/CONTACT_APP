import 'package:contact_app/Views/Formview/provider/ContactDataModelProivder.dart';
import 'package:contact_app/Views/HomeView/Provider/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage_ extends StatelessWidget {
  MainPage_({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactData = Provider.of<ContactDataProvider>(context).allContacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle()),
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
            Transform.translate(
              offset: Offset(-70, 3),
              child: Text(
                "your Contacts",
                style: GoogleFonts.poppins(
                    fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Divider(),
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
                : Container(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, 'subPage');
                        },
                        leading: CircleAvatar(),
                        subtitle: Text(ContactData[0].mobileNumber),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.call,
                          ),
                        ),
                        title: Text(ContactData[0].titleName),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

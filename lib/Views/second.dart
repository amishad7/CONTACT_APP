import 'package:contact_app/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts_ extends StatefulWidget {
  const Contacts_({super.key});

  @override
  State<Contacts_> createState() => _Contacts_State();
}

class _Contacts_State extends State<Contacts_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        currentStep: Global.currentIndexStep,
        onStepContinue: () {
          setState(() {
            if (Global.currentIndexStep != 3) {
              Global.currentIndexStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (Global.currentIndexStep != 0) {
              Global.currentIndexStep--;
            }
          });
        },
        physics: const BouncingScrollPhysics(),
        steps: [
          Step(
            title: const Text("Mobile Number"),
            content: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.phone,
                ),
              ),
            ),
            isActive: (Global.currentIndexStep == 0) ? true : false,
          ),
          Step(
            title: const Text("First Name"),
            content: TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.person_circle,
                ),
              ),
            ),
            isActive: (Global.currentIndexStep == 1) ? true : false,
          ),
          Step(
            title: const Text("Last Name"),
            content: TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.person,
                ),
              ),
            ),
            isActive: (Global.currentIndexStep == 2) ? true : false,
          ),
          Step(
            title: const Text("Last Name"),
            isActive: (Global.currentIndexStep == 3) ? true : false,
            content: const CircleAvatar(
              radius: 50,
              child: Icon(CupertinoIcons.camera),
            ),
          ),
        ],
      ),
    );
  }
}

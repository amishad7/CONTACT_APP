import 'dart:io';

import 'package:contact_app/Utils/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Contacts_ extends StatefulWidget {
  const Contacts_({super.key});

  @override
  State<Contacts_> createState() => _Contacts_State();
}

class _Contacts_State extends State<Contacts_> {
  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    final _formKey = GlobalKey<FormState>();
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
            state: (Global.currentIndexStep == 0)
                ? StepState.editing
                : (Global.number == null)
                    ? StepState.error
                    : StepState.indexed,
            title: const Text("Mobile Number"),
            content: Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onSaved: (newValue) {
                  Global.number = newValue.toString();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                  ),
                ),
              ),
            ),
            isActive: (Global.currentIndexStep == 0) ? true : false,
          ),
          Step(
            state: (Global.currentIndexStep == 1)
                ? StepState.editing
                : (Global.name == null && Global.l_name == null)
                    ? StepState.error
                    : StepState.indexed,
            title: const Text("Name information"),
            content: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    Global.name = newValue.toString();
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person_circle,
                    ),
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    Global.l_name = newValue.toString();
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                    ),
                  ),
                ),
              ],
            ),
            isActive: (Global.currentIndexStep == 1) ? true : false,
          ),
          Step(
            state: (Global.currentIndexStep == 2)
                ? StepState.editing
                : (Global.email == null)
                    ? StepState.error
                    : StepState.indexed,
            title: const Text("E-mail"),
            content: TextFormField(
              onSaved: (newValue) {
                Global.email = newValue.toString();
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.mail_solid,
                ),
              ),
            ),
            isActive: (Global.currentIndexStep == 2) ? true : false,
          ),
          Step(
            state: (Global.currentIndexStep == 3)
                ? StepState.editing
                : StepState.indexed,
            title: const Text("Picture"),
            isActive: (Global.currentIndexStep == 3) ? true : false,
            content: InkWell(
              onTap: () async {
                Global.img = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                setState(() {});
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: (Global.img == null)
                    ? null
                    : Image.file(
                        File(Global.img!.path),
                      ).image,
                child: (Global.img == null)
                    ? const Icon(CupertinoIcons.camera)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:contact_app/Utils/Global.dart';
import 'package:contact_app/Views/Formview/provider/FormProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contacts_ extends StatefulWidget {
  const Contacts_({super.key});

  @override
  State<Contacts_> createState() => _Contacts_State();
}

class _Contacts_State extends State<Contacts_> {
  @override
  Widget build(BuildContext context) {
    Global.currentIndexStep = Provider.of<FormProivder>(context).f.index;

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Stepper(
              currentStep: Provider.of<FormProivder>(context).f.index,
              // stepIconBuilder: (stepIndex, stepState) => Icon(Icons.check),
              onStepContinue: () {
                Provider.of<FormProivder>(context, listen: false)
                    .ContinueStep();
                log("tapped");
                log("${Provider.of<FormProivder>(context).f.index}");

                if (Global.img != null ||
                    Provider.of<FormProivder>(context).f.index == 3) {
                  Navigator.pushReplacementNamed(context, 'Main');
                }
              },
              onStepCancel: () {
                Provider.of<FormProivder>(context, listen: false).CancelStep();
                log("${Provider.of<FormProivder>(context).f.index}");
              },
              steps: [
                Step(
                  state: (Global.currentIndexStep == 0)
                      ? StepState.editing
                      // : (Global.number == null)
                      //     ? StepState.error
                      : StepState.indexed,
                  title: const Text("Mobile Number"),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onSaved: (newValue) {
                        Global.number = newValue;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: "Number",
                        //label: Text("Num"),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
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
                      // : (Global.name == null && Global.l_name == null)
                      //     ? StepState.error
                      : StepState.indexed,
                  title: const Text("Name information"),
                  content: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: TextFormField(
                          onSaved: (newValue) {
                            Global.name = newValue.toString();
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.only(),
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            prefixIcon: Icon(
                              CupertinoIcons.person_circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          onSaved: (newValue) {
                            Global.l_name = newValue;
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            prefixIcon: Icon(
                              CupertinoIcons.person,
                            ),
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
                      // : (Global.email == null)
                      //     ? StepState.error
                      : StepState.indexed,
                  title: const Text("E-mail"),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: TextFormField(
                      onSaved: (newValue) {
                        Global.email = newValue.toString();
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.mail_solid,
                        ),
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
                      setState(() {});
                      Provider.of<FormProivder>(context, listen: false)
                          .pickImage();
                    },
                    child: CircleAvatar(
                      radius: 90,
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
          ),
        ],
      ),
    );
  }
}

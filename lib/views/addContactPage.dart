import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/contactModel.dart';
import '../utils/global.daRT.dart';
import '../utils/variable.dart';

class add_contact extends StatefulWidget {
  const add_contact({Key? key}) : super(key: key);

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int currentstepvalue = 0;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    List<Step> _steps = [
      Step(
        isActive: (currentstepvalue >= 0) ? true : false,
        state: (currentstepvalue > 0) ? StepState.indexed : StepState.editing,
        title: Text("Image Choose"),
        content: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: w * 0.18,
              foregroundImage: image != null
                  ? FileImage(
                      File(image!.path),
                    )
                  : null,
            ),
            FloatingActionButton.small(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 170,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Photo",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                              leading: Icon(CupertinoIcons.camera),
                              title: Text('Take photo'),
                              onTap: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? img = await picker.pickImage(
                                    source: ImageSource.camera);
                                if (img != null) {
                                  setState(() {
                                    image = File(img.path);
                                  });
                                  Navigator.of(context).pop();
                                }
                              }),
                          ListTile(
                              leading: Icon(CupertinoIcons.photo),
                              title: Text('Choose photo from gallery'),
                              onTap: () async {
                                ImagePicker picker = ImagePicker();
                                XFile? img = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (img != null) {
                                  setState(() {
                                    image = File(img.path);
                                  });
                                  Navigator.of(context).pop();
                                }
                              }),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      Step(
          isActive: (currentstepvalue >= 1) ? true : false,
          state: (currentstepvalue > 1) ? StepState.indexed : StepState.editing,
          title: Text("Full Name"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: firstnameController,
                onSaved: (newValue) {
                  FirstName = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your First Name...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  labelText: "First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lastnameController,
                onSaved: (newValue) {
                  LastName = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Last Name...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                    labelText: "Last Name",
                    border: const OutlineInputBorder()),
              ),
            ],
          )),
      Step(
        state: (currentstepvalue > 2) ? StepState.indexed : StepState.editing,
        isActive: (currentstepvalue >= 2) ? true : false,
        title: Text("Phone Number"),
        content: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              onSaved: (newValue) {
                PhoneNumber = newValue;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please Enter Your Phone Number...";
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                label: const Text("Phone Number"),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      Step(
          state: (currentstepvalue > 3) ? StepState.indexed : StepState.editing,
          isActive: (currentstepvalue >= 3) ? true : false,
          title: Text(
            "Email Id",
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onSaved: (newValue) {
                  Email = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Email...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  label: const Text("Email Id"),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          )),
    ];

    void _onStepContinue() {
      setState(() {
        if (currentstepvalue < _steps.length - 1) {
          currentstepvalue++;
        }
      });
    }

    void _onStepCancel() {
      setState(() {
        if (currentstepvalue > 0) {
          currentstepvalue--;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
        actions: [
          IconButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();

                // Contact c1 = Contact(
                //   firstname: FirstName,
                //   lastname: LastName,
                //   phonenumber: PhoneNumber,
                //   email: Email,
                //   image: image,
                // );

                Global.allcontacts.add(
                  Contact(
                    firstname: FirstName!,
                    lastname: LastName!,
                    phonenumber: PhoneNumber!,
                    email: Email!,
                    image: image,
                  ),
                );
                // print(c1);

                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              }
            },
            icon: const Icon(Icons.check),
          ),
          SizedBox(
            width: w * 0.001,
          ),
        ],
      ),
      body: Form(
        key: formkey,
        child: Stepper(
          type: StepperType.vertical,
          // onStepContinue: _onStepContinue,
          // onStepCancel: _onStepCancel,
          onStepTapped: (value) {},
          currentStep: currentstepvalue,
          steps: _steps,
          controlsBuilder: (context, details) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: h * 0.1,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _onStepContinue();
                  });
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: w * 0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _onStepCancel();
                  });
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

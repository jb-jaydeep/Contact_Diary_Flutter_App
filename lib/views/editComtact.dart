import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/contactModel.dart';
import '../utils/variable.dart';

class editcontact extends StatefulWidget {
  const editcontact({Key? key}) : super(key: key);

  @override
  State<editcontact> createState() => _editcontactState();
}

class _editcontactState extends State<editcontact> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.cancel_outlined),
        ),
        title: const Text("Edit Contact"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (formkey.currentState!.validate()) {
                  setState(() {
                    formkey.currentState!.save();
                    contact.firstname = FirstName!;
                    contact.lastname = LastName!;
                    contact.phonenumber = PhoneNumber!;
                    contact.email = Email!;
                    contact.image = image;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/",
                      (route) => false,
                    );
                  });
                }
                ;
              });
            },
            child: Icon(
              Icons.check,
              color: (isDarkMode) ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: formkey,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Stack(
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Photo",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                        leading:
                                            const Icon(CupertinoIcons.camera),
                                        title: const Text('Take photo'),
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
                                        leading:
                                            const Icon(CupertinoIcons.photo),
                                        title: const Text(
                                            'Choose photo from gallery'),
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
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

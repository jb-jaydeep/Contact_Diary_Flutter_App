import 'dart:io';

class Contact {
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  File? image;

  Contact({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    this.image,
  });
}

import 'dart:io';

class ThemeModel {
  bool isDark;

  ThemeModel({required this.isDark});
}

class ImageModal {
  File? image;

  ImageModal({this.image});
}

class User {
  final String username;
  final String password;
  User(this.username, this.password);
}

class ContactModel {
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  File? image;

  ContactModel({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    this.image,
  });
}

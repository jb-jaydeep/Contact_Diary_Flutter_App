import 'package:contact_diary_flutter_app/providers/providers.dart';
import 'package:contact_diary_flutter_app/utils/theme.dart';
import 'package:contact_diary_flutter_app/views/addContactPage.dart';
import 'package:contact_diary_flutter_app/views/editComtact.dart';
import 'package:contact_diary_flutter_app/views/editPage.dart';
import 'package:contact_diary_flutter_app/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isIntroVisited =
      prefs.getBool('IsIntroVisited') ?? false; //bool or null;

  bool isDarkTheme = prefs.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(isDark: isDarkTheme),
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ContactListPovider(),
        // ),
        // ChangeNotifierProvider(create: (context) => ImageProvider(),),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
          themeMode:
              (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
                  ? ThemeMode.light
                  : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          // initialRoute: (isIntroVisited) ? "/" : "intro-screen",
          //   initialRoute: 'intro-screen',

          routes: {
            '/': (context) => const homepage(),
            'add-contact': (context) => const add_contact(),
            // 'counter': (context) => const counterpage(),
            'edit-page': (context) => const editpage(),
            'edit-contact': (context) => const editcontact(),
          },
        );
      },
    ),
  );
}

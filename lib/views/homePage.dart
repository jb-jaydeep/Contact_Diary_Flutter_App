import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/providers.dart';
import '../utils/global.daRT.dart';
import '../utils/variable.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? popmenuvalue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
        ),
        actions: [
          // IconButton(
          //   onPressed: () async {
          //     SharedPreferences prefs = await SharedPreferences.getInstance();
          //     await prefs.remove('IsIntroVisited');
          //
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => introscreen(),
          //       ),
          //     );
          //   },
          //   icon: Icon(Icons.logout),
          // ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.circle),
          ),
          PopupMenuButton(
            initialValue: popmenuvalue,
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              popmenuvalue = value;
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "pohs",
                child: Text("Place On Home Screen"),
              ),
              PopupMenuItem(
                value: "vminu",
                child: Text("Voice Mail is Not Use"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          image = null;
          Navigator.of(context)
              .pushNamed('add-contact')
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
          alignment: Alignment.center,
          child: (Global.allcontacts.isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_box, size: h * 0.25, color: Colors.blue),
                    Text(
                      "You have not Contact yet",
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: Global.allcontacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('edit-page',
                            arguments: Global.allcontacts[index]);
                        setState(() {});
                      },
                      leading: CircleAvatar(
                        foregroundImage: (Global.allcontacts[index].image) !=
                                null
                            ? FileImage(Global.allcontacts[index].image as File)
                            : null,
                      ),
                      title: Text(
                        "${Global.allcontacts[index].firstname} ${Global.allcontacts[index].lastname}",
                      ),
                      subtitle: Text(
                        "+91 ${Global.allcontacts[index].phonenumber}",
                      ),
                      trailing: const Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    );
                  },
                )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/components/text_constant.dart';
import 'package:music_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        //logo //
        DrawerHeader(
          child: Center(
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),

        //home title // çalma listeleri
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: customText(text: "Home", isBold: true),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: customText(text: "Settings", isBold: true),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);

              //navigate to settings page // ayarlar sayfasına git
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
        ),

        //settings title // ayarlar
      ]),
    );
  }
}

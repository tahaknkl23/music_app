import 'package:flutter/material.dart';
import 'package:music_app/components/text_constant.dart';
import 'package:music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Settings", isBold: false),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //dark mode title // karanlık mod
          const Text(
            "Dark Mode",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),

          //switch button // anahtar düğmesi
          Switch(
            value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode(),
            onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          ),
        ]),
      ),
    );
  }
}

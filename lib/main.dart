import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).getTheme,
    );
  }
}

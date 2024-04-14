import 'package:flutter/material.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => ThemeProvider()), ChangeNotifierProvider(create: (context) => PlayListProvider())],
        child: const MyApp()),
  );
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

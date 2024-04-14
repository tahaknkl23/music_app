import 'package:flutter/material.dart';
import 'package:music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //is dark mode //karanlık mod mu
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          //darker shadow on bottom right //sağ altta daha koyu gölge
          BoxShadow(
            color: isDarkMode ? Colors.black : Colors.grey.shade300,
            offset: const Offset(4, 4), //sağa ve aşağıya kaydır
            blurRadius: 15, //gölgeyi bulanıklaştır
          ),
          BoxShadow(
            color: isDarkMode ? Colors.grey.shade800 : Colors.white,
            offset: const Offset(-4, -4), //sağa ve aşağıya kaydır
            blurRadius: 15, //gölgeyi bulanıklaştır
          ),

          //lighter shadow on top left // sol üstte daha açık gölge
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}

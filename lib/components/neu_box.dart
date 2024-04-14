import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          //darker shadow on bottom right //sağ altta daha koyu gölge
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4), //sağa ve aşağıya kaydır
            blurRadius: 15, //gölgeyi bulanıklaştır
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4), //sağa ve aşağıya kaydır
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

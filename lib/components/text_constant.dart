import 'package:flutter/material.dart';

Text customText({
  required String text,
  double? letterSpacing = 10.0,
  required bool isBold,
}) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(letterSpacing: letterSpacing, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
  );
}

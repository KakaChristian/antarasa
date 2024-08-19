import 'package:flutter/material.dart';

Widget textfieldName({required String name}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Text(name),
    ),
  );
}

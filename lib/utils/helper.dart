import 'package:flutter/material.dart';

void nextScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

DateTime convertFromString(String date) {
  final splitted = date.split('-');

  return DateTime(
      int.parse(splitted[0]), int.parse(splitted[1]), int.parse(splitted[2]));
}

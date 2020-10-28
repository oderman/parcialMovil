// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

import 'agregarhisto.dart';

class HistorialPage extends StatefulWidget {
  @override
  _HistorialPageState createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewHistoryPage(_addHistory),
      ],
    );
  }

  void _addHistory(String title, double amount) {}
}

import 'dart:js';

import 'package:diabeto/routes/home/home.dart';
import 'package:diabeto/routes/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login()
  },
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
  ));
}

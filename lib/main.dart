import 'package:diabeto/routes/seller/home/SellerHome.dart';
import 'package:diabeto/routes/loading/loading.dart';
import 'package:diabeto/routes/login/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // configureDependencies();

  await Supabase.initialize(
    url: 'https://bwbdylwtclynrkpkylgo.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ3YmR5bHd0Y2x5bnJrcGt5bGdvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTczOTY3MTksImV4cCI6MjAxMjk3MjcxOX0.1P3D2r2gWUJicd4Ao1gqN0gsfqNdIE7-MTOc1r1z08M',
  );

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/login': (context) => Login(),
      '/seller/home': (context) => SellerHome(),
  },
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
  ));
}

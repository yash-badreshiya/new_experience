import 'package:flutter/material.dart';
import 'package:new_experience/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_experience/routes/myroutes.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        Myroutes.homeRoute: (context) => const HomePage(),
        Myroutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}

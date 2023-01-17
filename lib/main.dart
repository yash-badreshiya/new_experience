import 'package:flutter/material.dart';
import 'package:new_experience/pages/login_page.dart';
import 'package:new_experience/routes/myroutes.dart';
import 'package:new_experience/widgets/themes.dart';
import 'pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.lighttheme(context),
      darkTheme: MyThemes.darktheme(context),
      initialRoute: Myroutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        Myroutes.homeRoute: (context) => const HomePage(),
        Myroutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}

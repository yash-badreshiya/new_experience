import 'package:flutter/material.dart';

import '../widgets/mydrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CATALOGUE",
          textScaleFactor: 2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Center(
        child: Text("Welcome to My App!"),
      ),
      drawer: const MyDrawer(),
    );
  }
}

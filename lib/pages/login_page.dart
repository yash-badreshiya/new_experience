// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:new_experience/routes/myroutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool buttonChange = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            const SizedBox(height: 20.0),
            Text(
              "Welcome $name",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Name",
                      labelText: "Name",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(buttonChange ? 50 : 8),
                    child: InkWell(
                      // splashColor: Colors.blue,
                      onTap: () async {
                        setState(() {
                          buttonChange = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.pushNamed(context, Myroutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 45,
                        width: buttonChange ? 50 : 150,
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //   color: Colors.red,
                        // ),
                        child: buttonChange
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),

                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Myroutes.homeRoute);
                  //   },
                  //   child: const Text("Login"),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

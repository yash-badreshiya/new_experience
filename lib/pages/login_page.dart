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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        buttonChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png"),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username Cannot Be Empty";
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot Be Empty";
                        } else if (value.length < 8) {
                          return "Password Length Should Be 8";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(buttonChange ? 50 : 8),
                      child: InkWell(
                        // splashColor: Colors.blue,
                        onTap: () {
                          moveToHome(context);
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
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/EmailField.dart';
import 'package:trashsure/components/LoginButton.dart';
import 'package:trashsure/components/MessageScreen.dart';
import 'package:trashsure/components/PasswordField.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/components/RegisterNavigateButton.dart';
import 'package:trashsure/pages/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  double _elementsOpacity = 1;
  bool loadingBallAppear = false;
  double loadingBallSize = 1;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: loadingBallAppear
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30.0),
                child: MessagesScreen())
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 70),
                            TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 300),
                              tween: Tween(begin: 1, end: _elementsOpacity),
                              builder: (_, value, __) => Opacity(
                                opacity: value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.flutter_dash,
                                        size: 60, color: Color(0xff21579C)),
                                    const SizedBox(height: 25),
                                    const Text(
                                      "Welcome,",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 35),
                                    ),
                                    Text(
                                      "Sign in to continue",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 35),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  EmailField(
                                      fadeEmail: _elementsOpacity == 0,
                                      emailController: emailController),
                                  const SizedBox(height: 40),
                                  PasswordField(
                                      fadePassword: _elementsOpacity == 0,
                                      passwordController: passwordController),
                                  const SizedBox(height: 60),
                                  LoginButton(
                                    elementsOpacity: _elementsOpacity,
                                    onTap: () {
                                      setState(() {
                                        _elementsOpacity = 0;
                                      });
                                    },
                                    onAnimatinoEnd: () async {
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      setState(() {
                                        loadingBallAppear = true;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  RegisterNavigateButton(
                                    elementsOpacity: _elementsOpacity,
                                    onTap: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

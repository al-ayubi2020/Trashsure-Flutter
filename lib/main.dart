import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/Drawer.dart';
import 'package:trashsure/pages/LoginPage.dart';
import 'package:trashsure/pages/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer: const DrawerCustom(),
          body: null,
        ));
  }
}
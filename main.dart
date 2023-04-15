import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home.dart';
import 'package:tugas_pbm_pertemuan_6/page/login.dart';
import 'package:tugas_pbm_pertemuan_6/page/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(username: ""),
      },
    );
  }
}

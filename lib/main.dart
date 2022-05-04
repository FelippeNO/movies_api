import 'package:desafio_tokenlab/core/ui/scale.dart';
import 'package:desafio_tokenlab/presentation/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Marvel",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Builder(builder: (BuildContext context) {
        Scale.init(context);
        return LoginPage();
      }),
    );
  }
}

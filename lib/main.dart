import 'package:flutter/material.dart';
import 'package:expense_manager/theme.dart';
import 'package:expense_manager/routes.dart';
import 'package:expense_manager/presentation/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: HomePage(),
      routes: Routes.builder(),
    );
  }
}



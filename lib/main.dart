import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import './ui/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: "Walle",
       theme: ThemeData(
         primarySwatch: Colors.indigo
       ),
       debugShowCheckedModeBanner: false,
       home: HomePage(),
    );
  }
}
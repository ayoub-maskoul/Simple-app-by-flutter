import 'package:flutter/material.dart';
import 'package:project/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Form Simple",
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}


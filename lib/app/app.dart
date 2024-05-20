import 'package:flutter/material.dart';
import 'package:number_generator_app/screen/number_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NumberGeneratorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

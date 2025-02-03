import 'package:flutter/material.dart';

import 'native_binding.dart';
import 'package:ffi/ffi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int a = 7;

  int b = 9;

  @override
  Widget build(BuildContext context) {
    int sum = sumFunction(a, b);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            ' Test Cpp with Flutter ',
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                helloWorld().toDartString(),
              ),
            ),
            Center(
              child: Text("Sum of $a and $b: $sum"),
            ),
          ],
        ),
      ),
    );
  }
}

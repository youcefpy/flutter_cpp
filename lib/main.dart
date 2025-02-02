import 'package:flutter/material.dart';

import 'native_binding.dart';
import 'package:ffi/ffi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter + C++')),
        body: Center(
          child: Text(
            helloWorld().toDartString(),
          ),
        ),
      ),
    );
  }
}

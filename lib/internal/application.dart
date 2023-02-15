import 'package:flutter/material.dart';

import 'package:flutter_time/presentation/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Home(),
    );
  }
}

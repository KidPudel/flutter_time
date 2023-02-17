import 'package:flutter/material.dart';
import 'package:flutter_time/common/constants.dart';

import 'package:flutter_time/presentation/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    var constants = Constants.of(context);
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: constants?.spanishLavender, secondary: constants?.selectiveYellow),
      ),
      home: Home(),
    );
  }
}

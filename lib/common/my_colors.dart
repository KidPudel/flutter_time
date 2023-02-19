import 'package:flutter/cupertino.dart';

class MyColors extends InheritedWidget {
  final Color spanishLavender = const Color.fromARGB(255, 73, 43, 131);
  final Color selectiveYellow = const Color.fromARGB(255, 249, 182, 26);
  final Color bakerMilkPink = const Color.fromARGB(255, 255, 153, 187);
  final Color lightCyan = const Color.fromARGB(255, 215, 255, 255);

  const MyColors({required Widget child, super.key}) : super(child: child);

  static MyColors? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyColors>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

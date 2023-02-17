import 'package:flutter/cupertino.dart';

class Constants extends InheritedWidget {
  final String url = "http:/192.168.1.8:8080";
  final Color spanishLavender = const Color.fromARGB(255, 73, 43, 131);
  final Color selectiveYellow = const Color.fromARGB(255, 249, 182, 26);
  final Color bakerMilkPink = const Color.fromARGB(255, 255, 153, 187);
  final Color lightCyan = const Color.fromARGB(255, 215, 255, 255);

  const Constants({required Widget child, super.key}) : super(child: child);

  static Constants? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Constants>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

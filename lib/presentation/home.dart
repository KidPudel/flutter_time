import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time/common/my_colors.dart';
import 'package:flutter_time/domain/models/character.dart';
import 'package:flutter_time/domain/use_cases/characters_use_case.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character> characters = List.empty();
  Color? color;

  @override
  Widget build(BuildContext context) {
    _changeColor(context);
    var constants = MyColors.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter time"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Click to discover characters"),
                  ElevatedButton(
                    onPressed: () => _getCharacters(context),
                    child: Text("Click"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getCharacters(BuildContext context) async {
    final charactersUseCase = locator.get<CharactersUseCase>();
    if (characters.isEmpty) {
      final receivedCharacters = await charactersUseCase.getCharacters();
      setState(() {
        characters = receivedCharacters;
      });
    }
    if (context.mounted) {
      _showSnackBar(context);
    }
  }

  void _showSnackBar(BuildContext context) {
    _changeColor(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Navigate to character list, but i can tell that first is ${characters.isNotEmpty ? characters.first.fullName : "oops.. it isn't ready yet.."}"),
      ),
    );
  }

  void _changeColor(BuildContext context) async {
    var myColors = MyColors.of(context);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        if (!(color == myColors?.bakerMilkPink)) {
          color = myColors?.bakerMilkPink;
        } else {
          color = myColors?.selectiveYellow;
        }
      });
    }
  }
}

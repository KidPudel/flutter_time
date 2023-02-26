import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time/common/my_colors.dart';
import 'package:flutter_time/domain/models/character.dart';
import 'package:flutter_time/domain/use_cases/characters_use_case.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';
import 'package:flutter_time/presentation/details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    final myColors = MyColors.of(context);
    return FutureBuilder<List<Character>>(
      future: _getCharacters(),
      builder: (context, AsyncSnapshot<List<Character>> characters) {
        if (characters.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter time"),
            ),
            body: Row(
              children: [
                Expanded(
                    child: Container(
                  color: myColors?.bakerMilkPink,
                  child: ListView.builder(
                    itemCount: characters.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                name: characters.data
                                        ?.elementAt(index)
                                        .name ??
                                    "error",
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: boxDecoration(
                                backgroundColor: myColors?.spanishLavender,
                                borderColor: Colors.black),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: boxDecoration(
                                        backgroundColor: myColors?.lightCyan,
                                        borderColor: myColors?.selectiveYellow),
                                    height: 100.0,
                                    width: 100.0,
                                    child: Image.network(
                                        characters.data?.elementAt(index).image ??
                                            "",
                                        width: 100.0),
                                  ),
                                  SizedBox(width: 20.0),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            characters.data
                                                    ?.elementAt(index)
                                                    .fullName ??
                                                "stranger",
                                            style: TextStyle(
                                                color: myColors?.lightCyan,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25.0),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ))
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  BoxDecoration boxDecoration({Color? backgroundColor, Color? borderColor}) {
    return BoxDecoration(
      border: Border.all(width: 5, color: borderColor ?? Colors.black),
      color: backgroundColor,
    );
  }

  Future<List<Character>> _getCharacters() async {
    final useCase = locator.get<CharactersUseCase>();
    final character = await useCase.getCharacters();
    return character;
  }
}

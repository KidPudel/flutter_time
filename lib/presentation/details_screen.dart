import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time/common/my_colors.dart';
import 'package:flutter_time/domain/models/character.dart';
import 'package:flutter_time/domain/use_cases/character_use_case.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.name});

  final String? name;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Character>(
      future: _getCharacter(),
      builder: (context, AsyncSnapshot<Character> character) {
        if (character.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Details"),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      color: MyColors
                          .of(context)
                          ?.bakerMilkPink,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 10.0, color: Colors.black),
                                  color: MyColors
                                      .of(context)
                                      ?.spanishLavender,
                                ),
                                // inside of inner card
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 10.0,
                                                    color: MyColors
                                                        .of(context)
                                                        ?.selectiveYellow ??
                                                        Colors.black),
                                                color: MyColors
                                                    .of(context)
                                                    ?.lightCyan,
                                              ),
                                              child: Image.network(
                                                  character.data?.image ?? "",
                                                  width: 150.0, height: 150.0),
                                            ),
                                          ),
                                          Text(
                                            "Name: ${character.data?.fullName ??
                                                "Unknown"}",
                                            style: TextStyle(
                                                color: MyColors
                                                    .of(context)
                                                    ?.lightCyan,
                                                fontSize: 25),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Divider(
                                              color: Colors.black,
                                              thickness: 10.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Info:",
                                                style: TextStyle(
                                                    color: MyColors
                                                        .of(context)
                                                        ?.lightCyan,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 10.0,
                                                    color: MyColors
                                                        .of(context)
                                                        ?.selectiveYellow ??
                                                        Colors.black),
                                                color: MyColors
                                                    .of(context)
                                                    ?.lightCyan,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Species: ${character.data
                                                        ?.species ??
                                                        "Unknown"}",
                                                    style: TextStyle(
                                                        color: MyColors
                                                            .of(
                                                            context)
                                                            ?.spanishLavender,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    "Age: ${character.data
                                                        ?.age ??
                                                        "Unknown"} y.o",
                                                    style: TextStyle(
                                                        color: MyColors
                                                            .of(
                                                            context)
                                                            ?.spanishLavender,
                                                        fontSize: 25),
                                                  ),
                                                  Text(
                                                    "Gender: ${character.data
                                                        ?.sex ?? "Unknown"}",
                                                    style: TextStyle(
                                                        color: MyColors
                                                            .of(
                                                            context)
                                                            ?.spanishLavender,
                                                        fontSize: 25),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Quotes:",
                                                style: TextStyle(
                                                    color: MyColors
                                                        .of(context)
                                                        ?.lightCyan,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 10.0,
                                                    color: MyColors
                                                        .of(context)
                                                        ?.selectiveYellow ??
                                                        Colors.black),
                                                color: MyColors
                                                    .of(context)
                                                    ?.lightCyan,
                                              ),
                                              child: SizedBox(
                                                height: 50.0,
                                                child: ListView.builder(
                                                  itemCount: character
                                                      .data?.quotes?.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Text(
                                                        character.data?.quotes
                                                            ?.elementAt(
                                                            index) ?? "");
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<Character> _getCharacter() async {
    final useCase = locator.get<CharacterUseCase>();
    final character = await useCase.getCharacters(widget.name ?? "");
    return character;
  }

  List<Widget> listOfQuotes({Character? character}) {
    List<Widget> quotes = [];
    character?.quotes?.forEach((quote) => quotes.add(Text(quote)));
    return quotes;
  }
}

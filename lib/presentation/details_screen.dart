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
      builder:(context, AsyncSnapshot<Character> character) {
        if (character.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Details"),
            ),
            body: Row(
              children: [
                Expanded(
                  child: Container(
                    color: MyColors
                        .of(context)
                        ?.bakerMilkPink,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${character.data?.fullName}'s page"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },);
  }

  Future<Character> _getCharacter() async {
    final useCase = locator.get<CharacterUseCase>();
    final character = await useCase.getCharacters(widget.name ?? "");
    return character;
  }
}

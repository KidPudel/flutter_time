import 'dart:ffi';

import 'package:flutter_time/domain/irepositories/icharacter_repository.dart';
import 'package:flutter_time/domain/models/character.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';

class CharactersUseCase {
  Future<List<Character>> getCharacters() async {
    final repository = locator.get<ICharacterRepository>();
    final charactersDto = await repository.getCharactersFromApi();
    print("in repository everything is fine, length of dto objects is: ${charactersDto.length}");
    List<Character> characters = charactersDto
        .map((characterDto) => characterDto.toCharacter())
        .toList();
    return characters;
  }
}

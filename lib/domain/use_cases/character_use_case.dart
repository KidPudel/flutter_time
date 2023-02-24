import 'package:flutter_time/domain/irepositories/icharacter_repository.dart';
import 'package:flutter_time/domain/models/character.dart';
import 'package:flutter_time/internal/dependency_injection/locator.dart';

class CharacterUseCase {
  Future<Character> getCharacters(String name) async {
    final repository = locator.get<ICharacterRepository>();
    final characterDto = await repository.getCharacterFromApi(name);
    final character = characterDto.toCharacter();
    return character;
  }
}
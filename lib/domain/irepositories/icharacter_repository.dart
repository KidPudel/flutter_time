import 'package:flutter_time/data/remote/dto/character_dto.dart';

abstract class ICharacterRepository {
  /// Get list of adventure time characters from an API
  Future<List<CharacterDto>> getCharactersFromApi();

  /// Get specified adventure time character based on [name] from an API
  Future<CharacterDto> getCharacterFromApi(String name);
}
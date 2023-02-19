import 'dart:convert';

import 'package:flutter_time/common/constants.dart';
import 'package:flutter_time/data/remote/dto/character_dto.dart';
import 'package:flutter_time/domain/irepositories/icharacter_repository.dart';
import 'package:http/http.dart' as http;

class CharacterRepository implements ICharacterRepository {
  @override
  Future<List<CharacterDto>> getCharactersFromApi() async {
    final constants = Constants();
    final url = Uri.http(constants.url, "characters");
    final response = await http.get(url);
    List<CharacterDto> decodedResponse =
        List.filled(0, CharacterDto(), growable: true);
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        for (var character in body) {
          decodedResponse.add(CharacterDto.fromJson(character));
        }
      }
    } on Exception catch (e) {
      throw e;
    }

    return decodedResponse;
  }

  @override
  Future<CharacterDto> getCharacterFromApi(String name) {
    // TODO: implement getCharacterFromApi
    throw UnimplementedError();
  }
}

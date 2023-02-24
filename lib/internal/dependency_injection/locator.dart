import 'package:flutter_time/data/repositories/character_repository.dart';
import 'package:flutter_time/domain/irepositories/icharacter_repository.dart';
import 'package:flutter_time/domain/use_cases/character_use_case.dart';
import 'package:flutter_time/domain/use_cases/characters_use_case.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void inject() {
  locator
      .registerLazySingleton<ICharacterRepository>(() => CharacterRepository());

  locator.registerLazySingleton<CharactersUseCase>(() => CharactersUseCase());

  locator.registerLazySingleton<CharacterUseCase>(() => CharacterUseCase());
}

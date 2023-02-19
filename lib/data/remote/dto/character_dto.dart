import 'package:flutter_time/domain/models/character.dart';

class CharacterDto {
  String? fullName;
  String? name;
  String? species;
  int? age;
  String? sex;
  List<String>? quotes;
  String? image;

  CharacterDto({
    this.fullName,
    this.name,
    this.species,
    this.age,
    this.sex,
    this.quotes,
    this.image,
  });

  CharacterDto.fromJson(dynamic json) {
    fullName = json['fullName'];
    name = json['name'];
    species = json['species'];
    age = json['age'];
    sex = json['sex'];
    quotes = json['quotes'] != null ? json['quotes'].cast<String>() : [];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['fullName'] = fullName;
    json['name'] = name;
    json['species'] = species;
    json['age'] = age;
    json['sex'] = sex;
    json['quotes'] = quotes;
    json['image'] = image;
    return json;
  }

  Character toCharacter() {
    return Character(
      fullName: this.fullName,
      name: this.name,
      species: this.species,
      age: this.age,
      sex: this.sex,
      quotes: this.quotes,
      image: this.image,
    );
  }
}

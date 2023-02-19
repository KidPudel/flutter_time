class Character {
  String? fullName;
  String? name;
  String? species;
  int? age;
  String? sex;
  List<String>? quotes;
  String? image;

//<editor-fold desc="Data Methods">
  Character({
    this.fullName,
    this.name,
    this.species,
    this.age,
    this.sex,
    this.quotes,
    this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          name == other.name &&
          species == other.species &&
          age == other.age &&
          sex == other.sex &&
          quotes == other.quotes &&
          image == other.image);

  @override
  int get hashCode =>
      fullName.hashCode ^
      name.hashCode ^
      species.hashCode ^
      age.hashCode ^
      sex.hashCode ^
      quotes.hashCode ^
      image.hashCode;

  @override
  String toString() {
    return 'Character{ fullName: $fullName, name: $name, species: $species, age: $age, sex: $sex, quotes: $quotes, image: $image,}';
  }

  Character copyWith({
    String? fullName,
    String? name,
    String? species,
    int? age,
    String? sex,
    List<String>? quotes,
    String? image,
  }) {
    return Character(
      fullName: fullName ?? this.fullName,
      name: name ?? this.name,
      species: species ?? this.species,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      quotes: quotes ?? this.quotes,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': this.fullName,
      'name': this.name,
      'species': this.species,
      'age': this.age,
      'sex': this.sex,
      'quotes': this.quotes,
      'image': this.image,
    };
  }

  Character.fromMap(Map<String, dynamic> map) {
    fullName = map['fullName'] as String;
    name = map['name'] as String;
    species = map['species'] as String;
    age = map['age'] as int;
    sex = map['sex'] as String;
    quotes = map['quotes'] as List<String>;
    image = map['image'] as String;
  }
}

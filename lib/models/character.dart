// lib/models/character.dart
class Character {
  final String name;
  final String description;
  final String imagePath;
  bool isFavorite;

  Character({
    required this.name,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  });

  // Clone method to create a copy of the character
  Character copyWith({
    String? name,
    String? description,
    String? imagePath,
    bool? isFavorite,
  }) {
    return Character(
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
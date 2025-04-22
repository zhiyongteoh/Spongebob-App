// lib/services/character_service.dart
import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterService extends ChangeNotifier {
  // List of all characters
  final List<Character> _characters = [
    Character(
      name: 'Spongebob SquarePants',
      description:
          'A yellow anthropomorphic sea sponge who usually wears brown short pants, a white collared shirt, and a red tie. He works as a fry cook at the Krusty Krab.',
      imagePath: 'lib/images/spongebob.png',
    ),
    Character(
      name: 'Patrick Star',
      description:
          'A pink starfish who lives under a rock and is SpongeBob\'s best friend. Despite his good nature, Patrick is foolish, ignorant, and often inadvertently causes trouble.',
      imagePath: 'lib/images/Patrick.png',
    ),
    Character(
      name: 'Squidward Tentacles',
      description:
          'An octopus who lives in an Easter Island head between SpongeBob and Patrick. He\'s SpongeBob\'s neighbor and coworker at the Krusty Krab.',
      imagePath: 'lib/images/Squilliam.png', // Using squilliam image for Squidward
    ),
    Character(
      name: 'Mr. Krabs',
      description:
          'A red crab who owns and operates the Krusty Krab restaurant, where SpongeBob works. He is extremely greedy and obsessed with money.',
      imagePath: 'lib/images/mr.krabs.png',
    ),
    Character(
      name: 'Sandy Cheeks',
      description:
          'A squirrel from Texas who lives underwater in a glass dome. She wears a diving suit to breathe underwater and is known for her scientific knowledge and karate skills.',
      imagePath: 'lib/images/sandy.png',
    ),
    Character(
      name: 'Plankton',
      description:
          'A tiny green copepod who owns the Chum Bucket restaurant across from the Krusty Krab. His lifelong goal is to steal the Krabby Patty secret formula.',
      imagePath: 'lib/images/plankton.png',
    ),
    Character(
      name: 'Gary the Snail',
      description:
          'SpongeBob\'s pet snail who meows like a cat. Despite being a snail, Gary is very intelligent and is shown to be more mature than SpongeBob in many situations.',
      imagePath: 'lib/images/Gary.png',
    ),
    Character(
      name: 'Mrs. Puff',
      description:
          'A pufferfish who is SpongeBob\'s boating school teacher. Despite her best efforts, she has been unable to teach SpongeBob how to drive.',
      imagePath: 'lib/images/Mrs.puff.png',
    ),
    Character(
      name: 'Pearl Krabs',
      description:
          'Mr. Krabs\' teenage whale daughter. She is interested in typical teenage girl stuff like shopping, boys, and sleepovers.',
      imagePath: 'lib/images/Pearl-krabs.png',
    ),
  ];

  // Getter for all characters
  List<Character> get characters => _characters;

  // Getter for favorite characters
  List<Character> get favorites => _characters.where((char) => char.isFavorite).toList();

  // Search characters
  List<Character> searchCharacters(String query) {
    if (query.isEmpty) return _characters;
    
    return _characters.where((char) => 
      char.name.toLowerCase().contains(query.toLowerCase()) ||
      char.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Toggle favorite status
  void toggleFavorite(int index) {
    _characters[index].isFavorite = !_characters[index].isFavorite;
    notifyListeners();
  }

  // Find character index by name
  int findCharacterIndex(String name) {
    return _characters.indexWhere((char) => char.name == name);
  }
}
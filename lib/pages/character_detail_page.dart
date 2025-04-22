import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spongebob/models/character.dart';
import 'package:spongebob/services/character_service.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  final int index;

  const CharacterDetailPage({super.key, required this.character, required this.index});

  // Get background color based on character name
  Color getCharacterColor() {
    switch (character.name) {
      case 'Spongebob SquarePants':
        return Colors.yellow[50]!;
      case 'Patrick Star':
        return Colors.pink[50]!;
      case 'Squidward Tentacles':
        return Colors.teal[50]!;
      case 'Mr. Krabs':
        return Colors.red[50]!;
      case 'Sandy Cheeks':
        return Colors.brown[50]!;
      case 'Plankton':
        return Colors.green[50]!;
      case 'Gary the Snail':
        return Colors.blue[50]!;
      case 'Mrs. Puff':
        return Colors.lime[100]!;
      default:
        return Colors.grey[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use character-specific background color
    return Scaffold(
      backgroundColor: getCharacterColor(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Consumer<CharacterService>(
            builder: (context, characterService, child) {
              return IconButton(
                icon: Icon(
                  character.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink,
                ),
                onPressed: () {
                  characterService.toggleFavorite(index);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Character image with a tinted container based on character
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getCharacterColor().withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: getCharacterColor().withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      character.imagePath,
                      height: 400,
                      width: 400,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              
              // Character name
              Center(
                child: Text(
                  character.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // About section with themed background
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description title
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Character description
                    Text(
                      character.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Fun facts section with themed background
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fun facts section
                    const Text(
                      'Fun Facts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Some fictional fun facts based on the character
                    _buildFunFact(character.name),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildFunFact(String name) {
    // Return different fun facts based on the character name
    switch (name) {
      case 'Spongebob SquarePants':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _factItem('Lives in a pineapple under the sea'),
            _factItem('Works as a fry cook at the Krusty Krab'),
            _factItem('Best friends with Patrick Star'),
            _factItem('Has a pet snail named Gary'),
          ],
        );
      case 'Patrick Star':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _factItem('Lives under a rock'),
            _factItem('Best friends with SpongeBob'),
            _factItem('Often says "Is mayonnaise an instrument?"'),
            _factItem('Enjoys jellyfishing with SpongeBob'),
          ],
        );
      case 'Squidward Tentacles':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _factItem('Plays the clarinet'),
            _factItem('Lives in an Easter Island head'),
            _factItem('Works as a cashier at the Krusty Krab'),
            _factItem('Aspires to be a famous musician'),
          ],
        );
      case 'Mr. Krabs':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _factItem('Owner of the Krusty Krab restaurant'),
            _factItem('Father of Pearl Krabs'),
            _factItem('Former navy cadet'),
            _factItem('Known for his love of money'),
          ],
        );
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _factItem('A beloved character from Bikini Bottom'),
            _factItem('Part of the underwater world of SpongeBob'),
            _factItem('Has appeared in multiple episodes'),
          ],
        );
    }
  }
  
  Widget _factItem(String fact) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fact,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}